class CreateFoodNutrients < ActiveRecord::Migration
  def change
    create_table :food_nutrients do |t|
      t.integer :value
      t.string :nutrient_name
      t.string :unit

      t.timestamps null: false
    end
  end
end
