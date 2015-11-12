class Rating < ActiveRecord::Base
	after_create :add_new_rating
	before_update :remove_old_rating
	after_update :compute_rating_after_update
	before_destroy :remove_old_rating
	after_destroy :compute_rating_after_update

	belongs_to :user
	belongs_to :book_page

	validates :user, uniqueness: { scope: :book_page }

	validate :rating_between_0_and_5
	def rating_between_0_and_5
		self.errors.add :rating, 'Rating cannot be more than 0 or less than 5' \
			unless self.rating >= 0 && self.rating <= 5
	end

	
	def add_new_rating
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

	def remove_old_rating
		book = BookPage.find(self.book_page_id)
		@old_avg_rating = book.avg_rating
		@number_of_users = Rating.where("book_page_id == ?", self.book_page_id).count
		@old_rating = Rating.where("book_page_id == ? AND user_id == ?", self.book_page_id, self.user_id)
		@old_total = @old_avg_rating * @number_of_users
		@new_total = @old_total - self.rating
		if @number_of_users - 1 == 0
			book.avg_rating = nil
		else
			@new_avg_rating = @new_total / (@number_of_users-1)
			book.avg_rating = @new_avg_rating
		end
		book.save
	end

	def compute_rating_after_update
		book = BookPage.find(self.book_page_id)
		@ratings = Rating.where("book_page_id == ?", self.book_page_id)
		if @ratings.count == 0
			book.avg_rating = nil
			return
		end
		@total = 0
		@ratings.each do |r|
			@total += r.rating
		end
		@avg_rating = @total / @ratings.count
		book.avg_rating = @avg_rating
		book.save
	end
end
