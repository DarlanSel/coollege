class Student < ApplicationRecord
  include Personable

  validates :grade, presence: true

  belongs_to :grade
end
