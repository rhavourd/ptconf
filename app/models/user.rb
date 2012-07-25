# == Schema Information
#
# Table name: users
#
#  created_at      :datetime         not null
#  email           :string(255)
#  first_name      :string(255)
#  full_name       :string(255)
#  id              :integer          not null, primary key
#  last_name       :string(255)
#  password_digest :string(255)
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  include UpdateFullName
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :active_user,
                  :user_is_a_teacher, :user_is_a_student

  validates_uniqueness_of :email

  has_many :courses, :through => :teacher
  has_many :conference_dates, :through => :teacher

  has_one :teacher, :dependent => :destroy
  has_one :student, :dependent => :destroy

  scope :active, where(:active_user => true)

  def active_user?
    self.active_user
  end

  def enable_login!
    self.active_user = true
  end

  def disable_login!
    self.active_user = false
  end

  def can_login?
    active_user? && password_digest.present?
  end

  def user_is_a_teacher?
    self.teacher.present? && self.teacher.active_teacher
  end

  def teacher_id
    self.teacher.id   if user_is_a_teacher?
  end

  def user_is_a_teacher!
    unless self.teacher.present?
      tchr = self.build_teacher
      tchr.active_teacher = true
      tchr.save!
    end
  end

  def disable_teacher!
    if user_is_a_teacher?
      tchr = self.teacher
      tchr.active_teacher = false
      tchr.save!
    end
  end

  def user_is_a_teacher=(enable)
    if %w(1 true yes).include?(enable)
      self.user_is_a_teacher!
    else
      self.disable_teacher!
    end
  end

  def user_is_a_student?
    self.student.present? && self.student.active_student
  end

  def student_id
    self.student.id   if user_is_a_student?
  end

  def user_is_a_student!
    unless self.student.present?
      std = self.build_student
      std.active_student = true
      std.save!
    end
  end

  def disable_student!
    if user_is_a_student?
      std = self.student
      std.active_student = false
      std.save!
    end
  end

  def user_is_a_student=(enable)
    if %w(1 true yes).include?(enable)
      self.user_is_a_student!
    else
      self.disable_student!
    end
  end

end
