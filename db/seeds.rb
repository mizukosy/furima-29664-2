# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  item = Item.create!(name:'a',text:'aaa',category_id:'2',status_id:'2',price:'500', delivery_chager_id: 2, prefecture_id:'2', delivery_days_id:'2', user_id:'2')
  item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
end