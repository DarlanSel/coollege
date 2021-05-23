class SubjectClass < ApplicationRecord
  validates :start_date, :end_date, presence: true

  belongs_to :subject
  belongs_to :grade
  belongs_to :teacher
end
