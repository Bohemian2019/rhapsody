class ShoppingCart < ApplicationRecord

  belongs_to :user
  has_one :order
  has_many :items, through: :cart_items, dependent: :destroy

end
