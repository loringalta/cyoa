n2 = FoodNutrient.create(nutrient_name: 'calcium', nutrient_title: 'calcium', unit: 'g', value: 3)
n3 = FoodNutrient.create(nutrient_name: 'magnesium', nutrient_title: 'magnesium', unit: 'g', value: 4)
n1 = FoodNutrient.create(
  nutrient_name: 'calorie',
  nutrient_title: 'calorie',
  unit: 'g',
  value: 2
  )

f1 = FoodItem.create(
  search_query: 'apple',
  name: 'apple',
  group: 'fruit',
  foodid: 1234,
  num_result: 3,
  nutrients: [n1, n2, n3]
)

FoodItem.create(
  search_query: 'apple',
  name: 'banana',
  group: 'fruit',
  foodid: 1234,
  num_result: 1,
  nutrients: [n1]
)


User.create([
  { username: 'green',
    email: '1@mail.com',
    password: '1',
    password_confirmation: '1',
    food_items: [f1]
  },
  { username: 'pink',
    email: 'pink@mail.com',
    password: '12345678',
    password_confirmation: '12345678',
    food_items: [f1]
  }
  ])
