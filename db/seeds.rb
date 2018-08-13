# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Restaurant.destroy_all
meals_attributes = [
  {
    name:         "Strogonoff De Frango",
    description:      "Acompanhamento: Arroz Integral",
    price_cents: 1000

  },
  {

    name:         "Macarrão Integral",
    description:      "Molho 4 queijos",
    price_cents: 1000

  },
  {

    name:         "Isca de Frango",
    description:      "Acompanhamento: Salada ou Arroz Integral",
    price_cents: 1000

  }

]
meals_attributes.each { |params| Meal.create!(params) }
