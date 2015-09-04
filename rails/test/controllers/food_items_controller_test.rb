require 'test_helper'

class FoodItemsControllerTest < ActionController::TestCase
  setup do
    @food_item = food_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_items)
  end

  test "should create food_item" do
    assert_difference('FoodItem.count') do
      post :create, food_item: { foodid: @food_item.foodid, group: @food_item.group, name: @food_item.name }
    end

    assert_response 201
  end

  test "should show food_item" do
    get :show, id: @food_item
    assert_response :success
  end

  test "should update food_item" do
    put :update, id: @food_item, food_item: { foodid: @food_item.foodid, group: @food_item.group, name: @food_item.name }
    assert_response 204
  end

  test "should destroy food_item" do
    assert_difference('FoodItem.count', -1) do
      delete :destroy, id: @food_item
    end

    assert_response 204
  end
end
