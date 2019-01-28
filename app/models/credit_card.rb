class CreditCard < ApplicationRecord

  validates :name, length: {in: 2..20}, presence: true
  validates :card_number, length: {in: 15..16}, presence: true
  validates :month, presence: true
  validates :year, presence: true

  belongs_to :user
end