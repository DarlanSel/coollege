class PersonInvite < ApplicationRecord
  belongs_to :person

  enum :status, %w[active accepted denied]
end
