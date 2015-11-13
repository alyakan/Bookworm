# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
# Author : Kareem Tarek.

u = User.create(id: 1, first_name: 'johndoe', last_name: 'johndoe', email: 'johndoe@gmail.com', password: 'password', date_of_birth: '1993-11-7' )

u_2 = User.create(id: 2, first_name: 'sarahdoe', last_name: 'sarahdoe', email: 'sarahdoe@gmail.com', password: 'password', date_of_birth: '1993-11-7' )

b = BookPage.create(id:1, title:'Harry Potter', genre:'Fiction', ISBN:1234)

b_2 = BookPage.create(id:2, title:'Naruto', genre:'Anime', ISBN:12345)

r = Review.create(id:3 , user:u, book_page:b, review:"Great book")

rc = ReviewComment.create(id: 1, user:u_2, review:r, comment:"Couldn't agree more")

rc_2 = ReviewComment.create(id: 2, user:u, review:r, comment:"Good we're on the same page")

request_1 = Follow.create(id: 1, sender:u, receiver:u_2)