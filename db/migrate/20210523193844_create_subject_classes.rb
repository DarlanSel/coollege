class CreateSubjectClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_classes do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :subject, null: false, foreign_key: true
      t.references :grade, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
