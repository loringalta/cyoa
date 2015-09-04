class AddFoodItemRefToFoodNutrition < ActiveRecord::Migration
  def change
    add_reference :food_nutrients, :food_item, index: true, foreign_key: true
  end
end
