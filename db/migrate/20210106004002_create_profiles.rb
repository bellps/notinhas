class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date, null: false
      t.string :nickname, unique: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
