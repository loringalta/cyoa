class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :group
      t.text :nutrients
      t.integer :foodid

      t.timestamps null: false
    end
  end
end
