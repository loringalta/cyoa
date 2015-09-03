class FoodItemSerializer < ActiveModel::Serializer
  attributes :foodid, :name, :nutrients, :group
end
