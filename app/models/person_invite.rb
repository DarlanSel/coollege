class PersonInvite < ApplicationRecord
  validates :email, presence: true
  belongs_to :person
end
