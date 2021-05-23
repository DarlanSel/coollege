class Person < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :school
  delegated_type :personable, types: %w[ Teacher Student ]
end

module Personable
  extend ActiveSupport::Concern

  included do
    has_one :person, as: :personable, touch: true
  end
end
