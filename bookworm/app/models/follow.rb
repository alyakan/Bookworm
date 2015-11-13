class Follow < ActiveRecord::Base
	belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_id'

    validates_presence_of :sender_id,:message=>"Request must have a sender"
    validates_presence_of :receiver_id,:message=>"Request must have a receiver"

    scope :friend_requests, ->(receiver_id) {
  	where(:receiver_id => receiver_id).order("created_at DESC").limit(10) }

	validate :accept
		def validate_accept
			self.errors.add :accept, 'invalid status'\
			unless self.accept==0 || self.accept==1 || self.accept==2
		end

  	after_update :reject_request


  	def reject_request
  		if self.accept == 2
  			self.destroy
  		end
	end
end
