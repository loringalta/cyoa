class FoodItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :foodid, :group
  has_many :nutrients
end
