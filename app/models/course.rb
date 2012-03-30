class Course < ActiveRecord::Base
  attr_accessible :code, :description, :first_day, :last_day
  belongs_to :user

  validates :user_id, :presence => true
  validates :first_day, :presence => true
  validates :last_day, :presence => true

  #validates :first_day, :date => {:before_or_equal_to => :last_day}
  #validates :last_day, :date => {:after_or_equal_to => :first_day}
end
