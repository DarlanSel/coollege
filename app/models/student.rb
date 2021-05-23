class Student < ApplicationRecord
  include Personable

  belongs_to :grade
end
