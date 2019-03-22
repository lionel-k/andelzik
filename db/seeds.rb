# frozen_string_literal: true

User.destroy_all
Album.destroy_all
Purchase.destroy_all
Product.destroy_all

Random.rand(20..30).times do
  User.create!(name: Faker::Name.name)
end

Random.rand(20..30).times do
  Album.create!(title: Faker::Music.album,
                       performer: Faker::Name.name,
                       cost: Random.rand(10..100))
end

Random.rand(20..30).times do
  Purchase.create!(album: Album.all.sample, user: User.all.sample)
end

Random.rand(20..30).times do
  Product.create!(name: Faker::Commerce.product_name,
    category: Faker::Commerce.material,
    price: Random.rand(10..100))
end
