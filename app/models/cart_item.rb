class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :shopping_cart


  # Search method
  def self.search(keyword_artist, keyword_item)
    if keyword_artist or keyword_item
      relation = CartItem.joins({:shopping_cart => :user}, {:item => :artist})
      relation.merge(Artist.where("artist_name LIKE '%#{keyword_artist}%'")).merge(Item.where("item_name LIKE '%#{keyword_item}%'"))
    else
      all
    end
  end
end
