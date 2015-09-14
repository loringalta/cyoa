class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :food_items
end
