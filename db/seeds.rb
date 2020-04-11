require 'faker'
#I had to nest it according to Rayhan because of ID issues.
puts "Destroy everything"
Buyer.destroy_all
Inquiry.destroy_all
Seller.destroy_all
User.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating 20 fake users/buyers...'
20.times do
  user = User.new(
  email: Faker::Internet.unique.email,
  # username: Faker::Alphanumeric.alpha(number: 10),
  password: 'password'
  )
  user.save!

  # puts 'Creating 200 fake artists...'
  # 5.times do
  buyer = Buyer.new(
  remote_photo_url: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"), #This is a fallback, use active storage next time for seeding instead, lecture somewhere.
  name:    Faker::Name.name,
  biography: Faker::Quote.most_interesting_man_in_the_world,
  intentions:  Faker::Artist.name,
  contact:  Faker::Artist.name,
  size:  Faker::Number.between(from: 1, to: 100),
  country:  CountryStateSelect.countries_collection.map { |country| country[1].to_s }.sample,
  city:  Faker::Address.city,
  phone:  Faker::PhoneNumber.cell_phone,
  types:  Buyer.types.sample(1),
  )
  buyer.user = user
  buyer.save!

  # end
  # puts 'Finished!'
  # art_mediums = ['Painting', 'Drawing', 'Sculpting', 'Architecture', 'Ceramic', 'Electronic', 'Light', 'Graphic', 'Photography', 'Textile', 'Performance', 'Poetry', 'Literature', 'Collage', 'Digital', 'Animation', 'Body', 'Street', 'Graffiti', 'Glass', 'Tapestry', 'Installation', 'Calligraphy', 'Dance', '' ]
  # art_styles = ["Abstract", "Realist", "Modern", "Pop", "Cubism", "Deco", "Nouveau", "Surrealism", "Contemporary", "Abstract Expressionism", 'Post-Impressionism', 'Collage', 'Figure Drawing', 'Landscapes', 'Still Life',  'Graffiti', ]
  puts 'Creating 10 fake inquiries...'
  2.times do
    inquiry = Inquiry.new(
    title: Faker::Lorem.sentences(number: 1),
    information_usage: Faker::Lorem.sentences(number: 1),
    requirements: Faker::Lorem.sentences(number: 1),
    reward: Faker::Commerce.price,
    anonymous: Faker::Boolean.boolean,
    total: Faker::Number.between(from: 0, to: 2500),
    types: Inquiry.types.sample(1),
    hidden: Faker::Boolean.boolean,
    format: Inquiry.formats.sample(1),
    instructions: Faker::Lorem.sentences(number: 1),
    buyer: buyer
    )
    inquiry.save!
  end
  puts 'Finished!'
end
puts 'Finished!'



puts 'Creating 40 fake users/sellers...'
40.times do
  user = User.new(
  email: Faker::Internet.unique.email,
  # username: Faker::Alphanumeric.alpha(number: 10),
  password: 'password'
  )
  user.save!
  # artist_categories = ['Painting', 'Drawing', 'Sculpting', 'Architecture', 'Ceramics', 'Electronic', 'Light', 'Graphic', 'Photography', 'Textile', 'Performance', 'Poetry', 'Literature', 'Collage', 'Digital', 'Animation', 'Body', 'Street', 'Graffiti', 'Glass', 'Tapestry', 'Installation', 'Calligraphy', 'Dance']
  seller_cities = ['Chicago', 'Taipei', 'Moscow', 'Helsinki', 'Quito', 'New York', 'Rio De Janeiro', 'Melbourne', 'Geneva', 'Zurich', 'Almaty', 'Jakarta', 'Canggu', 'Singapore', 'Tunis', 'Copenhagen', 'Milan', 'Sydney', 'Cape Town', 'Vladivostok', 'Berlin', 'London', 'Paris', 'Stockholm', 'Algiers', 'Istanbul', 'Athens', 'Izmir', 'Osaka', 'Tokyo', 'Seoul', 'Beijing', 'Hanoi', 'Goa', 'Karachi', 'Kabul', 'Tehran', 'Tashkent', 'Dushanbe', 'Casablanca', 'Cairo', 'Beirut', 'Auckland', 'Santa Monica', 'Vancouver', 'Tijuana', 'Mexico', 'Khartoum', 'Kazan', 'Shiraz', 'Baghdad', 'Dhaka', 'Lisbon', 'Barcelona', 'Warsaw', 'Oslo', 'Havana', 'Salvador', 'Santiago', 'Lima', 'Manila', 'Bangkok', 'Lagos', 'Nairobi', 'Accra', 'Kinhasa', 'Toronto', 'Perth', 'Mexico City', 'Minsk', 'Kiev', 'Jerusalem', 'Riyadh', 'Dubai', 'Muscat', 'Jakarta', 'Prague', 'Amsterdam', 'Mogadishu', 'Bishkek', 'Dushanbe', 'Wuhan', 'Caracas', 'Salvador', 'Belize City', 'Tijuana' 'Seattle', 'Portland', 'Goa',]
  # puts 'Creating 200 fake artists...'
  # 5.times do
  seller = Seller.new(
  age:    Faker::Number.between(from: 0, to: 100),
  country:  CountryStateSelect.countries_collection.map { |country| country[1].to_s }.sample,
  sex:    Faker::Gender.binary_type,
  occupation:    Seller.occupation.sample(1),
  city:  seller_cities.sample,
  income:    Seller.income.sample(1),
  ethnicity:    Seller.ethnicity.sample(1),
  race:    Seller.race.sample(1),
  religion:    Seller.religion.sample(1),
  sexuality:    Seller.sexuality.sample(1),
  politics:    Seller.politics.sample(1),
  relationship_status:    Seller.relationship_status.sample(1),
  children:    Faker::Boolean.boolean,
  smoker:    Faker::Boolean.boolean,
  verified:    Faker::Boolean.boolean,
  birth_country:    CountryStateSelect.countries_collection.map { |country| country[1].to_s }.sample,
  education_level:    Seller.education_level.sample(1),
  types:    Seller.types.sample(2),
  )
  seller.user = user
  seller.save!
end
puts 'Finished!'

# puts "Creating some seller inquiries..."
# 20.times do
#   sellerinquiry = Sellerinquiry.new(
#     inquiry: Inquiry.,
#     seller: Seller.sample(1),
#   completed: DateTime.current
#   )
# end
