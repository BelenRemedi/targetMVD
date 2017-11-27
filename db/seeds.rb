# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.create(id: 1, name: 'Travel')
Topic.create(id: 2, name: 'Food')
Topic.create(id: 3, name: 'Series')
Topic.create(id: 4, name: 'Dating')
Topic.create(id: 5, name: 'Football')
Topic.create(id: 6, name: 'Dating')
Topic.create(id: 7, name: 'Movies')
Topic.create(id: 8, name: 'Art')
Topic.create(id: 9, name: 'Politics')

Chat.create(receiver_id: 2, sender_id: 3, topic_id: 2)
