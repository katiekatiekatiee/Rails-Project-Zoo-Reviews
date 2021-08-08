class ChangeLocationColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :locations, :location, :name
  end
end
