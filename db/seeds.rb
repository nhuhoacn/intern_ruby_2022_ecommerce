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
    product_image = product.product_images.create!
    product_image.image.attach(io: File.open("app/assets/images/ProductImage/product#{rand(1..5)}.jpg"), filename: "product#{rand(1..35)}.jpg")
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
10.times do |n|
  Image.create!(
    image: "/assets/",
    product_id: Faker::Number.between(from: 8, to: 18),
  )
end
