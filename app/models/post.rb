class Post < ApplicationRecord

  validates :name, {presence: true, length: { in: 1..24 }}
  validates :content, {presence: true, length: {maximum: 1024}}

  mount_uploader :image_name, ImageUploader

  def file_name
    self.image_name.file.filename
  end

  def content_type
    self.image_name.content_type
  end

end
