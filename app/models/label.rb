class Label < ApplicationRecord

  has_many :labels, dependent: :destroy

end
