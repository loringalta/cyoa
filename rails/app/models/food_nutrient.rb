class FoodNutrient < ActiveRecord::Base
  belongs_to :food_item, class_name: 'FoodItem', inverse_of: :nutrients
end
