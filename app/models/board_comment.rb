class BoardComment < ApplicationRecord

  validates :comment, length: { in: 1..1000 }
  validates :comment, presence: true

  belongs_to :community
  belongs_to :user

end
