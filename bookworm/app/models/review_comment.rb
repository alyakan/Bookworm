class ReviewComment < ActiveRecord::Base
	# Author: Kareem Tarek

	belongs_to :user
	belongs_to :review

	validates_presence_of :comment, :message=>"Comment cannot be blank"
	validates_presence_of :user_id,:message=>"Comment must have a user"
	validates_presence_of :review_id, :message=> "Comment must be for a Review"

	scope :review_comments, ->(review_id) {
  	where(:review_id => review_id).order("created_at DESC").limit(10) }


end