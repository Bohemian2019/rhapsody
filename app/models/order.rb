class Order < ApplicationRecord

  belongs_to :shopping_cart

  # Search method
  def self.search(keyword)
    if keyword
      relation = Order.includes({:shopping_cart => {:items => :artist}}, :shopping_cart => :user)
      relation.where(items: {item_name: "lalala"})
    else
      all
    end
  end
end
