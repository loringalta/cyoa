require 'net/https'
require 'uri'
require 'json'
require 'pp'

class FoodItem < ActiveRecord::Base
  has_many :nutrients, class_name: 'FoodNutrient', foreign_key: 'nutrient_name'
  belongs_to :user, class_name: 'User', inverse_of: :food_items

  @@api = 'mLGtkAwgswBDghnwNP6nxQEsu0gXYBOGAp1WBhWn'
  @@search_query = nil

  def self.json_parse_result(search_query, num_results)
    @@search_query = search_query
    no_list = get_usda_food_no(search_query, num_results)
    return no_list.flatten.drop(1) if no_list.flatten.include? 'error'
    food_list = get_usda_food_info(no_list, num_results)
    obj_array = make_food_list(num_results, food_list, [])
    obj_array
  end

  def self.get_usda_food_no(search_query, num_results)
    usda = "http://api.nal.usda.gov/ndb/search/?format=json&q=#{search_query}&sort=r&max=#{num_results}&offset=0&api_key=#{@@api}"
    response = Unirest.get usda
    error = check_errors(response)
    return error unless error == []
    no_list = create_usda_food_num_list(response)
  end

  def self.create_usda_food_num_list(response, no_list = [])
    response.body['list']['item'].each do |item|
      no_list << [item['ndbno'], item['group']]
    end
    no_list
  end

  def self.get_usda_food_info(no_list, num_results)
    food_list = []
    no_list.each do |item_id, item_group|
      usda = "http://api.nal.usda.gov/ndb/reports/?ndbno=#{item_id}&type=b&max=#{num_results}&lt=g&sort=id&format=json&api_key=#{@@api}"
      response = Unirest.get usda
      food_list << [response.body['report']['food'], item_group]
    end
    food_list
  end

  def self.make_food_list(nr, food_list, obj_array)
    food_list.each do |item, item_group|
      new_food = make_food(nr, item, item_group)
      new_food.save!
      obj_array << new_food
    end
    obj_array
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

  def self.parse_nutrients(nutrient)
    food_nutrients = []
    nutrient.each do |item|
      food_nutrients = create_new_nutrient(item, food_nutrients)
    end
    food_nutrients
  end

  def self.create_new_nutrient(item, food_nutrients)
    new_nutrient = FoodNutrient.new

    new_nutrient.nutrient_title = item['name']
    new_nutrient.nutrient_name  = item['name']
    new_nutrient.unit           = item['unit']
    new_nutrient.value          = item['value']
    # new_nutrient.save!
    food_nutrients << new_nutrient
  end

  def self.make_food(num_results, item, item_group)
    food_nutrients = parse_nutrients(item['nutrients'])
    new_food_item = FoodItem.new
    new_food_item.search_query= @@search_query
    new_food_item.num_result  = num_results
    new_food_item.foodid      = item['ndbno']
    new_food_item.name        = item['name']
    new_food_item.group       = item_group
    new_food_item.nutrients   = food_nutrients
    new_food_item
  end
end
