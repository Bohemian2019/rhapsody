class Artist < ApplicationRecord

has_many :items, dependent: :destroy
has_many :subscriptions, dependent: :destroy
has_one :community

end
