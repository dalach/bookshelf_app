class Book < ActiveRecord::Base
  mount_uploader :cover_photo, CoverPhotoUploader
  has_and_belongs_to_many :bookshelves
  validates :title, :author, presence: true
  validates_format_of :cover_photo, with: %r{\.gif|jpg|png}i, :message => "Upload a cover photo jpg/jpeg/png"
end
