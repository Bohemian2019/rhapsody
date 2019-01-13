class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :songs, dependent: :destroy
  belongs_to :artist
  belongs_to :label

end
