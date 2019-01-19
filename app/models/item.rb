class Item < ApplicationRecord

  attachment :image

  has_many :shopping_carts, through: :cart_items, dependent: :destroy
  has_many :cart_items # 追加 'Fixed Association'　20190118
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
