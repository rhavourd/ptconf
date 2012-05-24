class Notifier < ActionMailer::Base
  default from: "ptconf@schools-open.com"

  def formatphone(phone)
    @phone = phone.gsub("(", "").gsub(")", "").gsub("-", "").gsub(".", "").gsub(" ", "")
    if @phone[0..0] != '1'
      #@phone = '1' + @phone
    end
    return @phone
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.profile_changed.subject
  #
  def profile_changed(record)
    @record = record
    @subject = "Your Profile Was Updated"
    @greeting = "Hello #{@record.first_name}"

    mail  to: "rhavourd@schools-open.com",
          subject: @subject

    case "SMS"
      when "SMS"
        # Send SMS
        RestClient.get 'https://api.tropo.com/1.0/sessions', {:params => {
            :action => 'create',
            :network => 'SMS',
            :token => '115631eddedf054bba3dc49e1557f4ad6da760654f9b77cb946c48df33b58150845a89f15e83c497dfcc63b6',
            :phonenumber => formatphone(record.phone),
            :messageToSend => 'dont forget your name is ' + record.full_name}}
      when "Call-1"
        # Make phone call
        RestClient.get 'https://api.tropo.com/1.0/sessions', {:params => {
            :action => 'create',
            :network => 'VOICE',
            :token => '115631eddedf054bba3dc49e1557f4ad6da760654f9b77cb946c48df33b58150845a89f15e83c497dfcc63b6',
            :phonenumber => formatphone(record.phone),
            :messageToSend => 'dont forget your name is ' + record.full_name}}

      when "Call-2"
        tropo = Tropo::Generator.new {
          result = call "17342317793"
          logger.debug "Notifier#profile_changed:Call-2:: call result= #{result.inspect}"

          result = say "Your profile has changed and I would like to confirm this with you."
          logger.debug "Notifier#profile_changed:Call-2:: say result= #{result.inspect}"

          result = ask("Is your name " + record.first_name + ", " + record.last_name + "?", {
              :choices => "yes(1), no(3)",
              :mode => "any",
              :voice => "Alan"
            }
          )
          logger.debug "Notifier#profile_changed:Call-2:: ask result= #{result.inspect}"
        }

    end

  end


end
