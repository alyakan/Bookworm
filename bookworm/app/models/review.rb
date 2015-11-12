class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :book_page

	validates_presence_of :review, :message=>"Review cannot be blank"
	validates_presence_of :user_id,:message=>"Review must have a user"
	validates_presence_of :book_page_id, :message=> "Review must be for a Book"

	scope :book_reviews, ->(book_page_id) {
  	where(:book_page_id => book_page_id) }
end
