

n2 = FoodNutrient.create(nutrient_name: 'calcium', unit: 'g', value: 3)
n3 = FoodNutrient.create(nutrient_name: 'magnesium', unit: 'g', value: 4)
n1 = FoodNutrient.new({
  nutrient_name: 'calorie',
  unit: 'g',
  value: 2
  })

FoodItem.create(
  name: 'apple',
  group: 'fruit',
  foodid: 1234,
  nutrients: [n1, n2, n3]
)

FoodItem.create(
  name: 'banana',
  group: 'fruit',
  foodid: 1234,
  nutrients: [n1]
)


User.create([
  { email: 'green@mail.com',
    password: '12345678', password_confirmation: '12345678' },
  { email: 'pink@mail.com',
    password: '12345678', password_confirmation: '12345678' }
  ])
