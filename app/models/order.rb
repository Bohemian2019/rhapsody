class Order < ApplicationRecord

  belongs_to :shopping_cart

  # Search method
  def self.search(keyword_artist, keyword_item)
    if keyword_artist or keyword_item
      relation = Order.joins({:shopping_cart => {:items => :artist}}, :shopping_cart => :user)
      relation.merge(Artist.where("artist_name LIKE '%#{keyword_artist}%'")).merge(Item.where("item_name LIKE '%#{keyword_item}%'"))
    else
      all
    end
  end
end
