class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image

  has_many :credit_cards, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :communities, through: :users_cummunities, dependent: :destroy
  has_many :shopping_carts, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  # Search method
  def self.search(keyword)
    if keyword
      where(['name LIKE ?', "%#{keyword}%"])
    else
      all
    end
  end
end
