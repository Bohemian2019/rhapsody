class Artist < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :artist_name, presence: true
end
