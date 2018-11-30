class Topic < ApplicationRecord

  validates :title, {presence: true, length: {maximum: 28}}

end
