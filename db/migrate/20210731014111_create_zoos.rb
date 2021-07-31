class CreateZoos < ActiveRecord::Migration[6.1]
  def change
    create_table :zoos do |t|

      t.timestamps
    end
  end
end
