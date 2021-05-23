class School < ApplicationRecord
  validates :name, :user, :slug, presence: true
  validates :slug, uniqueness: true

  belongs_to :user

  has_many :grades
end
