# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 =User.create(username: "DeidreDaug", name: "Dina Dynamo", password: "dynamo")  
user2 =User.create(username: "Bojack", name: "Bojack", password: "bojack") 
user3 = User.create(username: "Pops", name: "pops", password: "pops", admin: "true")

movie1 = Movie.create(title: "Black Panther", description: "Challa heir to Wakanda needs to kick some super butt", year: 2018, user_id: user1.id )  
movie2 = Movie.create(title: "Acquaman", description: "Acqua dude loses mom and tries to save the world from acquatic destruction", year: 2018, user_id: user2.id )    
movie3 = Movie.create(title: "Isle of Dogs", description: "Boy goes on a quest to find his missing dog and oppose the establishment", year: 2018, user_id: user2.id )    
     
movie1.movie_img.attach(io: File.open('app/assets/images/blackpanther.jpg'), filename: 'blackpanther.jpg', content_type: 'image/jpg')


movie2.movie_img.attach(io: File.open('app/assets/images/acqua.jpg'), filename: 'acqua.jpg', content_type: 'image/jpg')

movie3.movie_img.attach(io: File.open('app/assets/images/isleofdogs.jpg'), filename: 'isleofdogs.jpg', content_type: 'image/jpg')
