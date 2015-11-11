class UserReadBook < ActiveRecord::Base
	has_one :user
	has_one :book_page
	validate :status_value
		def status_value
			self.errors.add :status, 'invalid status'\
			unless self.status==0 || self.status==1 || self.status==2
		end
end
