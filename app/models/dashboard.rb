# == Schema Information
#
# Table name: dashboards
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  updated_at :datetime         not null
#

class Dashboard < ActiveRecord::Base
  def initialize(user = User.new)
    @user = user

  end
end
