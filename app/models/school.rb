class School < ApplicationRecord
  validates :name, :user, :slug, presence: true
  validates :slug, uniqueness: true

  belongs_to :user

  has_many :grades
  has_many :people, class_name: "Person", foreign_key: "school_id"
end
