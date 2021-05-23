class CreatePersonInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :person_invites do |t|
      t.integer :status, null: false, default: 0
      t.string :email, null: false
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
