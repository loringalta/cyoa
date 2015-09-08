require 'net/https'
require 'uri'
require 'json'
require 'pp'

class FoodItem < ActiveRecord::Base
  has_many :nutrients, class_name: 'FoodNutrient', foreign_key: 'nutrient_name'
  belongs_to :user, class_name: 'User', inverse_of: :food_items

  @@api = 'mLGtkAwgswBDghnwNP6nxQEsu0gXYBOGAp1WBhWn'
  def self.get_usda_food_info(no_list, num_results)
    food_list = []
    no_list.each do |item_id, item_group|
      usda = "http://api.nal.usda.gov/ndb/reports/?ndbno=#{item_id}&type=b&max=#{num_results}&lt=g&sort=id&format=json&api_key=#{@@api}"
      response = Unirest.get usda
      food_list << [response.body['report']['food'], item_group]
    end
    food_list
  end

  def self.check_errors(response)
    error_message = []
    if response.code == 404
      response.body['errors'].each do |e|
        error_message << e
      end
    end
    error_message
  end

  def self.create_usda_food_num_list(response, no_list = [])
    response.body['list']['item'].each do |item|
      no_list << [item['ndbno'], item['group']]
    end
    no_list
  end

  def self.get_usda_food_no(search_query, num_results)
    usda = "http://api.nal.usda.gov/ndb/search/?format=json&q=#{search_query}&sort=r&max=#{num_results}&offset=0&api_key=#{@@api}"
    response = Unirest.get usda
    error = check_errors(response)
    pp response
    return error unless error == []
    no_list = create_usda_food_num_list(response)
  end

  def self.make_food(num_results, new_food, item, item_group)
    food_nutrients = new_food.parse_nutrients(item['nutrients'])
    new_food.num_result = num_results
    new_food.foodid = item['ndbno']
    new_food.id = item['ndbno']
    new_food.name = item['name']
    new_food.group = item_group
    new_food.nutrients = food_nutrients
  end

  def self.make_food_list(nr, food_list, obj_array)
    food_list.each do |item, item_group|
      new_food = FoodItem.new
      make_food(nr, new_food, item, item_group)
      obj_array << new_food
    end
    obj_array
  end

  def self.json_parse_result(search_query, num_results)
    no_list = get_usda_food_no(search_query, num_results)
    return no_list.flatten.drop(1) if no_list.flatten.include? 'error'
    food_list = get_usda_food_info(no_list, num_results)
    obj_array = make_food_list(num_results, food_list, [])
    obj_array
  end

  def create_new_nutrient(item, food_nutrients)
    new_food                    = FoodNutrient.new
    new_food.nutrient_title     = item['name']
    new_food.unit               = item['unit']
    new_food.value              = item['value']
    new_food.id                 = item['nutrient_id']
    food_nutrients << new_food
  end

  def parse_nutrients(nutrient)
    food_nutrients = []
    nutrient.each do |item|
      food_nutrients = create_new_nutrient(item, food_nutrients)
    end
    food_nutrients
  end
end

