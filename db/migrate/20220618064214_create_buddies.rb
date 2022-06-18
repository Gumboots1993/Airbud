class CreateBuddies < ActiveRecord::Migration[6.1]
  def change
    create_table :buddies do |t|
      t.string :name
      t.string :type
      t.text :skills
      t.text :description
      t.text :activities
      t.integer :rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
