class Question < ApplicationRecord

  validates :question, length: { in: 1..300 }
  validates :question, presence: true

  has_many :answers, dependent: :destroy
  belongs_to :community
  belongs_to :user

end
