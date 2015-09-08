class UserSerializer < ActiveModel::Serializer
  attributes :id
  embed :ids, include: true
  has_many :food_items
end
