Product.destroy_all

10.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                   cost: rand(15),
                   country_of_origin: "USA")
end

40.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                   cost: rand(20),
                   country_of_origin: "Canada")
end

p "Created #{Product.count} products"

Review.destroy_all

250.times do |index|
  Review.create(author: Faker::Artist.name,
                content_body: Faker::Lorem.paragraph(sentence_count: 7, supplemental: true),
                rating: rand(5),
                product_id: rand(700) )
end

p "Created #{Review.count} reviews"
