# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Drink.create(
  name: 'Caipirinha',
  description: "Cachaça, also known as caninha, or any one of a multitude of traditional names, is Brazil's most common distilled alcoholic beverage. Although both rum and cachaça are made from sugarcane-derived products, in cachaça the alcohol results from the fermentation of fresh sugarcane juice that is then distilled, while rum is usually made from refinery by-products such as molasses.",
  alcohool_level: 45,
  distilled: true,
  temperature: :extra_cold,
  base_ingridient: 'cachaca',
  origin: 'South America',
  drinkware: 'Old Fashioned Glass'
)

Drink.create(
  name: 'Caipirinha',
  description: "Cachaça, also known as caninha, or any one of a multitude of traditional names, is Brazil's most common distilled alcoholic beverage. Although both rum and cachaça are made from sugarcane-derived products, in cachaça the alcohol results from the fermentation of fresh sugarcane juice that is then distilled, while rum is usually made from refinery by-products such as molasses.",
  alcohool_level: 45,
  distilled: true,
  temperature: :extra_cold,
  base_ingridient: 'cachaca',
  origin: 'South America',
  drinkware: 'Old Fashioned Glass'
)
