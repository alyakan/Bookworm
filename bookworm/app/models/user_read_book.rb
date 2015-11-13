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
			p = Post.new
			p.user1_id = self.user_id
			p.user2_id = self.user_id
			p.book_page_id = self.book_page_id
			p.content = 'status upated'
			p.save
		end
end
