class CreditCard < ApplicationRecord

  validates :name, length: {in: 2..20}
  validates :card_number, length: {in: 15..16}
  validates :month, presence: true
  validates :year, presence: true

  belongs_to :user
end