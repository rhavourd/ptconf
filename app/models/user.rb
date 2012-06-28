# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ActiveRecord::Base
  include UpdateFullName
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name
  validates_uniqueness_of :email

  has_many :courses, :dependent => :destroy
  has_many :conference_dates, :dependent => :destroy
end
