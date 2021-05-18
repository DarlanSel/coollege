class CreatePersonInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :person_invites do |t|
      t.references :person, null: false, foreign_key: true
      t.string :email, null: false

      t.timestamps
    end
  end
end
