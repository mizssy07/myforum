class Post < ApplicationRecord

  validates :name, {presence: true, length: { in: 1..24 }}
  validates :content, {presence: true, length: {maximum: 1024}}

end
