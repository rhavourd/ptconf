# == Schema Information
#
# Table name: teachers
#
#  active_teacher :boolean          default(FALSE)
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  updated_at     :datetime         not null
#  user_id        :integer
#

class Teacher < ActiveRecord::Base
  belongs_to :user
<<<<<<< HEAD
=======
  has_many :courses, :dependent => :destroy
  has_many :conference_dates, :dependent => :destroy

  def full_name
    user.full_name  if user.present?
  end
>>>>>>> jimjones
end
