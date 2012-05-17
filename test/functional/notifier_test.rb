require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "profile_changed" do
    mail = Notifier.profile_changed
    assert_equal "Profile changed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
