class Item < ApplicationRecord

  attachment :image

  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  has_many :songs, dependent: :destroy
  belongs_to :artist
  belongs_to :label

  attachment :image

  # Search method
  def self.search(keyword)
    if keyword
      relation = Item.joins(:artist)
      relation.merge(Artist.where(['artist_name LIKE ?', "%#{keyword}%"])).or(relation.where(['item_name LIKE ?', "%#{keyword}%"]))
    else
      Item.all
    end
  end
end
