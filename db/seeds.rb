require 'faker'

10.times do
    Recipe.create(name: Faker::Name.name, ingredients: Faker::Hipster.words)
end