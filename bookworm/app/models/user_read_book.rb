class UserReadBook < ActiveRecord::Base
	belongs_to :user
	belongs_to :book_page
	validates_presence_of :book_page_id
  	validates_presence_of :user_id
	validates :user, uniqueness: {scope: :book_page}
	validate :status_value
		def status_value
			self.errors.add :status, 'invalid status'\
			unless self.status==0 || self.status==1 || self.status==2
		end
	after_create :create_post
	after_update :create_post
		def create_post
			user = User.find(self.user_id)
			@user_name = user.first_name + ' ' + user.last_name
			book = BookPage.find(self.book_page_id)
			@book_title = book.title
			p = Post.new
			p.user1_id = self.user_id
			p.user2_id = self.user_id
			p.book_page_id = self.book_page_id
			if status==0
				p.content = @user_name + ' added ' + @book_title + ' to his/her reading list'
			end
			if status==1
				p.content = @user_name + ' is currently reading ' + @book_title
			end
			if status==2 
				p.content = @user_name + ' has read ' + @book_title
			end
			p.save
		end
end
