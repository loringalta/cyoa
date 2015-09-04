class FoodNutrientSerializer < ActiveModel::Serializer
  attributes :unit, :value, :nutrient_name
end
