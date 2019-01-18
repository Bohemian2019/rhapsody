class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image

  has_many :credit_cards, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  # 修正　'Fixed Association'　20190118 -----------------
  # has_many :communities, through: :users_cummunities
  has_many :communities, through: :users_communities
  # --------------------------------------------------
  has_many :users_communities # 追加　'Fixed Association'　20190118
  has_many :shopping_carts, dependent: :destroy
  has_many :board_comments
  has_many :questions
  has_many :answers

  # Search method
  def self.search(keyword)
    if keyword
      where(['name LIKE ?', "%#{keyword}%"])
    else
      all
    end
  end

  # Devise method override
  def active_for_authentication?
    super && !admin?
  end
end
