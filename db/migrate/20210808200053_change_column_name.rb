class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :locations, :state, :location
  end
end


