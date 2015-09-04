class Api::FoodNutrientsController < ApplicationController
  before_action :set_food_nutrient, only: [:show, :update, :destroy]

  # GET /food_nutrients
  # GET /food_nutrients.json
  def index
    @food_nutrients = FoodNutrient.all
    render json: @food_nutrients
  end

  # GET /food_nutrients/1
  # GET /food_nutrients/1.json
  def show
    render json: @food_nutrient
  end

  # POST /food_nutrients
  # POST /food_nutrients.json
  def create
    @food_nutrient = FoodNutrient.new(food_nutrient_params)

    if @food_nutrient.save
      render json: @food_nutrient, status: :created, location: @food_nutrient
    else
      render json: @food_nutrient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /food_nutrients/1
  # PATCH/PUT /food_nutrients/1.json
  def update
    @food_nutrient = FoodNutrient.find(params[:id])

    if @food_nutrient.update(food_nutrient_params)
      head :no_content
    else
      render json: @food_nutrient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /food_nutrients/1
  # DELETE /food_nutrients/1.json
  def destroy
    @food_nutrient.destroy

    head :no_content
  end

  private

    def set_food_nutrient
      @food_nutrient = FoodNutrient.find(params[:id])
    end

    def food_nutrient_params
      params.require(:food_nutrient).permit(:name, :unit, :value)
    end
end
