class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
    	t.string :search_query
      t.string :name
      t.integer :foodid
      t.string :group
      t.integer :num_result

      t.timestamps null: false
    end
  end
end
