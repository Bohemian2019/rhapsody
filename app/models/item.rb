class Item < ApplicationRecord

  has_many :shopping_carts, through: :cart_items, dependent: :destroy
  has_many :songs, dependent: :destroy
  belongs_to :artist
  belongs_to :label

  attachment :image
end
