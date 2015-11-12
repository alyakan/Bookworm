class BookPage < ActiveRecord::Base
	validates_presence_of :title, :message=>"Title cannot be blank"
	validates :title, uniqueness: {scope: :author}
	validates_presence_of :ISBN, :message=>"ISBN cannot be blank"
	validates_uniqueness_of :ISBN, :message => "Sorry this ISBN already exists."
	validates_presence_of :genre, :message=>"Genre cannot be blank"

	has_many :reviews, dependent: :destroy

	scope :highest_rating_by_genre, ->(genre) { where(:genre => genre).order("avg_rating DESC").limit(5) }
	scope :highest_rating, -> { order("avg_rating DESC").limit(5) }

end