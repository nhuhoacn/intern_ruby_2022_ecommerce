# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 4.times do |n|
#   Category.create!(
#     name: Faker::Lorem.sentence(word_count: 2),
#     parent_id: Faker::Number.decimal_part(digits: 1),
#     parent_path: Faker::Number.decimal_part(digits: 1),
#   )
# end

# 20.times do |n|
#   Product.create!(
#     name: Faker::Name.name_with_middle,
#     price: Faker::Number.number(digits: 3),
#     description: Faker::Lorem.sentence(word_count: 5),
#     quantity_in_stock: 10,
#     category_id: 1
#   )
# end

# 10.times do |n|
#   Image.create!(
#     image: "/assets/",
#     product_id: Faker::Number.between(from: 8, to: 18),
#   )
# end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ĐỀ PHÒNG AE NÀO VẪN GIỮ BẢNG IMAGES CŨ NHÉ
# 10.times do |n|
#   Image.create!(
#     image: "/assets/",
#     product_id: Faker::Number.between(from: 8, to: 18),
#   )
# end
require 'faker'

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "foobar"
  password_confirmation = "foobar"
  phone = Faker::PhoneNumber.cell_phone
  address = Faker::Address.street_address
  User.create!(name: name, phone: phone, address: address,
    password: password, password_confirmation: password_confirmation, email: email)
end

men = Category.create!(name: "Men")
woman = Category.create!(name: "Woman")
puts("create category")
3.times do
  name = Faker::Emotion.noun
  men.categories.new(name: name).save!

  name = Faker::Emotion.noun
  cate2 = woman.categories.new(name: name).save!
end

categories = Category.all
quantity_in_stock = 50
categories.each do |category|
  5.times do
    name = Faker::Nation.language
    product = category.products.create!(name: name, price: 50, quantity_in_stock: quantity_in_stock)
  end
end


users = User.all
5.times do
  status = rand(0..4)
  users.each { |user| user.orders.create!(status: status)}
end

orders = Order.all
orders.each do |order|
  rand(1..5).times do
    product_id = rand(1..40)
    order.order_details.create!(product_id: product_id)
  end
end
