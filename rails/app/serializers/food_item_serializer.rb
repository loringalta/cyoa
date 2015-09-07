class FoodItemSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :num_result, :foodid, :group
  has_many :nutrients
end
