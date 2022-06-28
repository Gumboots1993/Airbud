class AddCoordinatesToBuddies < ActiveRecord::Migration[6.1]
  def change
    add_column :buddies, :location, :string
    add_column :buddies, :latitude, :float
    add_column :buddies, :longitude, :float
  end
end
