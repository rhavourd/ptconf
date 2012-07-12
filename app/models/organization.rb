# == Schema Information
#
# Table name: organizations
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string(255)
#  updated_at :datetime         not null
#

class Organization < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
end
