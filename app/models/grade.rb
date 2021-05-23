class Grade < ApplicationRecord
  validates :name, presence: true

  belongs_to :school

  has_many :subject_classes

  scope :from_school, -> (school) { where(school: school)}
end
