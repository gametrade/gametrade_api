class Photo < ApplicationRecord
  belongs_to :game, optional: true

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' },
                            :storage => :cloudinary,
                            :path => ':id/:style/:filename'
  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\z}
end
