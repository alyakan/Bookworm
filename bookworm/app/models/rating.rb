class Rating < ActiveRecord::Base
	after_save :add_new_rating

	belongs_to :user
	belongs_to :book_page

	validates :user, uniqueness: { scope: :book_page }

	validate :rating_between_0_and_5
	def rating_between_0_and_5
		self.errors.add :rating, 'Rating cannot be more than 0 or less than 5' \
			unless self.rating >= 0 && self.rating <= 5
	end

	
	def add_new_rating
		puts "Hello"
		book = BookPage.find(self.book_page_id)
		if book.avg_rating == nil
			book.avg_rating = self.rating
		else
			@old_avg_rating = book.avg_rating
			@number_of_users = Rating.where("book_page_id == ?", self.book_page_id).count - 1
			@old_total = @old_avg_rating * @number_of_users
			@new_total = @old_total + self.rating
			@new_avg_rating = @new_total / (@number_of_users+1)
			book.avg_rating = @new_avg_rating
		end
		book.save
	end
end
