# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(name: 'Admin')
kitchen = Group.create!(name: 'Kitchen renovation', user_id: admin.id)
car = Group.create!(name: 'Car maintenance', user_id: admin.id)
books = Group.create!(name: 'Books, music & culture', user_id: admin.id)
subs = Group.create!(name: 'Subscriptions', user_id: admin.id)
tech = Group.create!(name: 'Technology', user_id: admin.id)

kitchen.icon.attach(io: File.open('app/assets/images/kitchen.jpg'), filename: 'kitchen.jpg', content_type: 'image/jpg')
car.icon.attach(io: File.open('app/assets/images/car.jpg'), filename: 'car.jpg', content_type: 'image/jpg')
books.icon.attach(io: File.open('app/assets/images/books.jpg'), filename: 'books.jpg', content_type: 'image/jpg')
subs.icon.attach(io: File.open('app/assets/images/subs.png'), filename: 'subs.png', content_type: 'image/png')
tech.icon.attach(io: File.open('app/assets/images/tech.jpg'), filename: 'tech.jpg', content_type: 'image/jpg')
