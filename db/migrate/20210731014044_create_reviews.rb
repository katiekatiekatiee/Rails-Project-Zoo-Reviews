class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content 
      t.integer :user_id
      t.integer :zoo_id
      t.timestamps
    end
  end
end
