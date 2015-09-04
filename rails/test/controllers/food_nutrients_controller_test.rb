require 'test_helper'

class FoodNutrientsControllerTest < ActionController::TestCase
  setup do
    @food_nutrient = food_nutrients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_nutrients)
  end

  test "should create food_nutrient" do
    assert_difference('FoodNutrient.count') do
      post :create, food_nutrient: { name: @food_nutrient.name, unit: @food_nutrient.unit, value: @food_nutrient.value }
    end

    assert_response 201
  end

  test "should show food_nutrient" do
    get :show, id: @food_nutrient
    assert_response :success
  end

  test "should update food_nutrient" do
    put :update, id: @food_nutrient, food_nutrient: { name: @food_nutrient.name, unit: @food_nutrient.unit, value: @food_nutrient.value }
    assert_response 204
  end

  test "should destroy food_nutrient" do
    assert_difference('FoodNutrient.count', -1) do
      delete :destroy, id: @food_nutrient
    end

    assert_response 204
  end
end
