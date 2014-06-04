class Book < ActiveRecord::Base
  mount_uploader :cover_photo, CoverPhotoUploader
  has_and_belongs_to_many :bookshelves
end
