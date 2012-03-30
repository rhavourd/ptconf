class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates_uniqueness_of :email

  has_many :courses, :dependent => :destroy
  has_many :conference_dates, :dependent => :destroy
end
