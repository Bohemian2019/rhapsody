class Community < ApplicationRecord

  attachment :image

  has_many :users, through: :users_cummunities
  has_many :board_comments, dependent: :destroy
  has_many :questions, dependent: :destroy

  attachment :image

  # Search method
  def self.search(keyword)
    if keyword
      where(['name LIKE ?', "%#{keyword}%"])
    else
      all
    end
  end
end
