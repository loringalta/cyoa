require 'json'

class Api::FoodItemsController < ApplicationController
  respond_to :json
  before_action :set_food_item, only: [:show, :update, :destroy]

  def index
    if params[:searchQuery].nil? || params[:numberOfResults].nil? || params[:searchQuery].empty?
      render json: @food_item
    else
      @@search_query = params[:searchQuery].gsub(' ', '%20')
      @@num_results = params[:numberOfResults]
      find_foods
      render json: @search_body_hash
    end
  end

  def show
    render json: @food_item
  end

  def update
    find_foods
    @food_item = FoodItem.find(params[:id])

    if @food_item.update(food_item_params)
      head :no_content
    else
      render json: @food_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @food_item.destroy

    head :no_content
  end

  def add
    search = Validate::AddFood.new(params)
    if search.valid?
      @@search_query = search.add_name.gsub(' ', '%20')
      @@search_query
    else
      render(json: { error: search.errors })
    end
  end

  def find_foods
    if FoodItem.where(name: @@search_query).where(num_result: @@num_results).blank?
      @search_body_hash = FoodItem.json_parse_result(@@search_query, @@num_results)
      check_error_status
    else
      @search_body_hash = FoodItem.where(search_query: @@search_query).where(num_result: @@num_results)
    end
  end

  def create_find_food
    @search_body_hash.each do |h|
      @food = FoodItem.new
      @food.search_query = @@search_query
      @food.num_result = @@num_results
      @food.name = h.name
      @food.group = h.group
      @food.nutrients = h.nutrients
      @food.foodid = h.id
      @food.save!
    end
  end

  def check_error_status
    if @search_body_hash[0]['status']
      @search_body_hash = @search_body_hash[0]
    else
      # create_find_food
    end
  end

  def isQuery?
    @@search_query.nil? || @@search_query.empty?
  end

  private

 def validate_params
    search = Validate::FoodItem.new(params)
    if search.valid?
      @@search_query = search.search.gsub(' ', '%20')
      @@num_results = search.num_results
      render(json: { success: 'yay' })
    else
      render(json: { error: search.errors })
    end
  end

    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    def food_item_params
      params.require(:food_item).permit(:name, :group, :nutrients, :foodid)
    end
end
