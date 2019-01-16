class Item < ApplicationRecord

  attachment :image

  has_many :shopping_carts, through: :cart_items, dependent: :destroy
  has_many :songs, dependent: :destroy
  belongs_to :artist
  belongs_to :label

end
