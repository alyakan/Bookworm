class Follow < ActiveRecord::Base
	belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
    belongs_to :receiver, :class_name => 'User', :foreign_key => 'receiver_id'

    validates_presence_of :sender_id,:message=>"Request must have a sender"
    validates_presence_of :receiver_id,:message=>"Request must have a receiver"

    scope :friend_requests, ->(receiver_id) {
  	where(:receiver_id => receiver_id).order("created_at DESC").limit(10) }
  	
end
