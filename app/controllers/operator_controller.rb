class OperatorController < ApplicationController
  def index
    tropo = Tropo::Generator.new do
      on :event => 'continue', :next => '/the_answer.json'
      ask({ :name => 'account_number',
            :bargein => 'true',
            :timeout => 30,
            :require => 'true' }) do
        say :value => 'Please enter your account number'
        choices :value => '[5 DIGITS]'
      end
    end
    tropo.response
  end

  def test
  end
end
