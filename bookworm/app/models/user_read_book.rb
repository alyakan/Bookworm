class UserReadBook < ActiveRecord::Base
	belongs_to :user
	belongs_to :book_page
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
			p.user1 = self.user
			p.user2 = self.user
			p.content = 'status upated'
		end
end
