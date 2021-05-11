class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name, presence: true
      t.string :slug, presence: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
