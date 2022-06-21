class ChangeTypeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :buddies, :type, :buddy_type
  end
end
