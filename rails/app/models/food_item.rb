class FoodItem < ActiveRecord::Base
  has_many :nutrients, class_name: 'FoodNutrient', foreign_key: 'nutrient_name'
end
