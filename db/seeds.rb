# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

def generate_title
  "#{Faker::App.name} #{Faker::Hacker.ingverb} for #{Faker::Hacker.noun}"
end

topics = %W(Technology Eats Exercise).map { |topic_name| Topic.find_or_create_by(name: topic_name) }

users = 3.times.map { User.create(name: Faker::Name.name, email: Faker::Internet.email) }

10.times do
  Post.create(
    user: users.sample,
    title: generate_title,
    content: Faker::Lorem.paragraphs(5, true).join("\u2028"),
    created_at: Faker::Date.backward(14),
    topic: topics.sample)
end

10.times do
  is_sellable = [true, false].sample
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Lorem.paragraph(4),
    sellable: is_sellable,
    created_at: Faker::Date.backward(14),
    topic: topics.sample)
end
