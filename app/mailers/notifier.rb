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

    if true
      # Send SMS
      RestClient.get 'https://api.tropo.com/1.0/sessions', {:params => {
          :action => 'create',
          :network => 'SMS',
          :token => '115631eddedf054bba3dc49e1557f4ad6da760654f9b77cb946c48df33b58150845a89f15e83c497dfcc63b6',
          :phonenumber => formatphone(record.phone),
          :messageToSend => 'dont forget your name is ' + record.full_name}}
    else
      # Make phone call
      RestClient.get 'https://api.tropo.com/1.0/sessions', {:params => {
          :action => 'create',
          :network => 'VOICE',
          :token => '115631eddedf054bba3dc49e1557f4ad6da760654f9b77cb946c48df33b58150845a89f15e83c497dfcc63b6',
          :phonenumber => formatphone(record.phone),
          :messageToSend => 'dont forget your name is ' + record.full_name}}
    end

  end


end
