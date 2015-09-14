class AddUserRefToFoodItem < ActiveRecord::Migration
  def change
    add_reference :food_items, :user, index: true, foreign_key: true
  end
end
