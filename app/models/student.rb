# == Schema Information
#
# Table name: students
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

class Student < ActiveRecord::Base
  include UpdateFullName

  attr_accessible :first_name, :last_name, :nickname, :relationships_attributes, :parent_id

  belongs_to :organization
  has_many :courses, :through => :rosters
  has_many :rosters, dependent: :destroy
  accepts_nested_attributes_for :rosters,
                                :allow_destroy => true,
                                :reject_if => proc {|attrs| attrs['course_id'].blank?}


  has_many :parents, :through => :relationships
  has_many :relationships, dependent: :destroy
  accepts_nested_attributes_for :relationships,
                                :allow_destroy => true,
                                :reject_if => proc {|attrs| attrs['parent_id'].blank?}

  def name
    full_name
  end

  def label
    full_name
  end

  def parent?(parent)
    relationships.find_by_parent_id(parent.id)
  end

  def parent!(parent)
    relationships.create!(parent_id: parent.id)
  end

  def unparent!(parent)
    relationships.find_by_parent_id(parent.id).destroy
  end

end
