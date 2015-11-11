class BookPage < ActiveRecord::Base
	validates_presence_of :title, :message=>"Title cannot be blank"
	validates_uniqueness_of :title, :scope => author, :message => "Sorry this book is already exists."
	validates_presence_of :ISBN, :message=>"ISBN cannot be blank"
	validates_uniqueness_of :ISBN, :message => "Sorry this ISBN already exists."
	validates_presence_of :genre, :message=>"Genre cannot be blank"
end
