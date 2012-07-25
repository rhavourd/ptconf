# == Schema Information
#
# Table name: courses
#
#  id          :integer         not null, primary key
#  code        :string(255)
#  description :string(255)
#  first_day   :date
#  last_day    :date
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  user_id     :integer
#

class Course < ActiveRecord::Base
  attr_accessible :code, :description, :first_day, :last_day, :rosters_attributes, :student_id

  belongs_to :teacher
  has_many :students, :through => :rosters
  has_many :rosters, dependent: :destroy
  accepts_nested_attributes_for :rosters,
                                :allow_destroy => true,
                                :reject_if => proc {|attrs| attrs['student_id'].blank?}

  validates :teacher_id, :presence => true
  validates :first_day, :presence => true
  validates :last_day, :presence => true

  #validates :first_day, :date => {:before_or_equal_to => :last_day}
  #validates :last_day, :date => {:after_or_equal_to => :first_day}

  def teacher_name
    teacher.full_name   if teacher.present?
  end
end
