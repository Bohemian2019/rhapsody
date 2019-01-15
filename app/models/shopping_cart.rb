class ShoppingCart < ApplicationRecord

  belongs_to :user
  belongs_to :order
  has_many :items, through: :cart_items  dependent: :destroy

end
