class OperatorController < ApplicationController
  skip_before_filter :authenticate
  layout nil

  def index
    my_controller_name = self.controller_name
    tropo = Tropo::Generator.new do
      on :event => 'continue', :next => File.join(my_controller_name,'acknowledge.json')
      ask({ :name => 'account_number',
            :bargein => 'true',
            :timeout => 30,
            :require => 'true' }) do
        say :value => 'Please enter your account number'
        choices :value => '[5 DIGITS]'
      end
    end
    render :json => tropo.response
  end

  def acknowledge
    tropo = Tropo::Generator.new do
      say :value => 'Thank you. Have a good day.'
    end
  end
end
