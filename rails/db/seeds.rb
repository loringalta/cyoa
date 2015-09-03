20.times do
  FoodItem.create(
    foodid: Faker::Number.number(4),
    name: Faker::Lorem.words.join(' '),
    nutrients: Faker::Lorem.words.join(' '),
    group: Faker::Lorem.words.join(' ')
    )
end

User.create([
  { email: 'green@mail.com',
    password: '12345678', password_confirmation: '12345678' },
  { email: 'pink@mail.com',
    password: '12345678', password_confirmation: '12345678' }
  ])
