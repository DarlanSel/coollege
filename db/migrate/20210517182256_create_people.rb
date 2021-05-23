class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.string :personable_type, null: false
      t.integer :personable_id, null: false

      t.timestamps
    end
  end
end
