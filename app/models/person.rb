class Person < ApplicationRecord
  validates :name, presence: true

  belongs_to :user, optional: true
  belongs_to :school
  delegated_type :personable, types: %w[ Teacher Student ]

  scope :from_school, -> (school) { where(school: school) }
end

module Personable
  extend ActiveSupport::Concern

  included do
    has_one :person, as: :personable, touch: true

    before_destroy :destroy_person

    def destroy_person
      person.destroy
    end
  end
end
