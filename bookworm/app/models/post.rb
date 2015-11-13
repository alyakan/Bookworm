class Post < ActiveRecord::Base
	belongs_to :user1, :class_name => "User", :foreign_key => "user1_id"
  	belongs_to :user2, :class_name => "User", :foreign_key => "user2_id"
  	belongs_to :book_page

  	validates_presence_of :book_page_id, :message=> "post must belong to a Book"
  	validates_presence_of :user1_id, :message=> "post must belong to a user"
  	validates_presence_of :user2_id, :message=> "post must belong to a user"
end
