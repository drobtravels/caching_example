# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

def generate_title
  "#{Faker::App.name} #{Faker::Hacker.ingverb} for #{Faker::Hacker.noun}"
end

3.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

  2.times do
    Post.create(
      user: user,
      title: generate_title,
      content: Faker::Lorem.paragraphs(5, true).join("\u2028"))
  end
end
