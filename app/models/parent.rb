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
  include UpdateFullName

  after_update :notify_updated

  attr_accessible :first_name, :last_name, :nickname, :organization_id, :email, :phone, :phone_has_sms

  belongs_to :organization

  has_many :students, :through => :relationships

  has_many :relationships, dependent: :destroy
  accepts_nested_attributes_for :relationships,
                                :allow_destroy => true,
                                :reject_if => proc {|attrs| attrs['student_id'].blank?}

  private

  def notify_updated
    logger.debug "Parent#notify_updated #{self.inspect}"
    Notifier.profile_changed(self).deliver
  end
end
