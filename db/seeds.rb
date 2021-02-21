# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(title: 'Mini Tacos', description: 'Filled with our lovely pulled pork', price: 69, category: 'starters')
Product.create(title: 'Tenderloins', description: 'Best meat in town', price: 199, category: 'main')
Product.create(title: 'Rainbow Ice cream', description: 'Because why not..?', price: 129, category: 'desserts')