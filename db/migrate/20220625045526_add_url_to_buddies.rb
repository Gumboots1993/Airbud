class AddUrlToBuddies < ActiveRecord::Migration[6.1]
  def change
    add_column :buddies, :url, :string
  end
end
