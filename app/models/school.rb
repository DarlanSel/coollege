class School < ApplicationRecord
  validates :name, :user, :slug, presence: true

  belongs_to :user
end
