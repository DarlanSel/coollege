class Subject < ApplicationRecord
  validates :name, presence: true

  belongs_to :school

  scope :from_school, -> (school) { where(school: school) }
end
