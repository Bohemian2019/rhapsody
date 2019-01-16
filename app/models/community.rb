class Community < ApplicationRecord

  has_many :users, through: :users_cummunities, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  has_many :questions, dependent: :destroy

  attachment :image
end
