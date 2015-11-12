class AddAttachmentImageToBookPages < ActiveRecord::Migration
  def self.up
    change_table :book_pages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :book_pages, :image
  end
end
