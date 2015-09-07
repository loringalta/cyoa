class FoodNutrientSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :unit, :value, :nutrient_name, :nutrient_title
end
