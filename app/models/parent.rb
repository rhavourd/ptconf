# == Schema Information
#
# Table name: parents
#
#  id              :integer         not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  full_name       :string(255)
#  nickname        :string(255)
#  organization_id :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Parent < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :nickname, :students_attributes
  belongs_to :organization
  has_and_belongs_to_many :students
  accepts_nested_attributes_for :students
end
