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
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :user_is_a_teacher
  validates_uniqueness_of :email

  has_many :courses, :dependent => :destroy
  has_many :conference_dates, :dependent => :destroy

  has_one :teacher, :dependent => :destroy

  def user_is_a_teacher?
    self.teacher.present? && self.teacher.active_teacher
  end

  def user_is_a_teacher!
    unless user_is_a_teacher?
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

end
