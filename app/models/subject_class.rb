class SubjectClass < ApplicationRecord
  validates :start_date, :end_date, presence: true

  belongs_to :subject
  belongs_to :grade
  belongs_to :teacher

  def self.from_school(school)
    school.grades.flat_map { |g| g.subject_classes }
  end

end
