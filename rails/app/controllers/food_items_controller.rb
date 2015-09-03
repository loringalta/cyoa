class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :update, :destroy]

  # GET /food_items
  # GET /food_items.json
  def index
    @food_items = FoodItem.all

    render json: @food_items
  end

  # GET /food_items/1
  # GET /food_items/1.json
  def show
    render json: @food_item
  end

  # POST /food_items
  # POST /food_items.json
  def create
    @food_item = FoodItem.new(food_item_params)

    if @food_item.save
      render json: @food_item, status: :created, location: @food_item
    else
      render json: @food_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /food_items/1
  # PATCH/PUT /food_items/1.json
  def update
    @food_item = FoodItem.find(params[:id])

    if @food_item.update(food_item_params)
      head :no_content
    else
      render json: @food_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /food_items/1
  # DELETE /food_items/1.json
  def destroy
    @food_item.destroy

    head :no_content
  end

  private

    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    def food_item_params
      params.require(:food_item).permit(:name, :group, :nutrients, :foodid)
    end
end
