class Community < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :artist_name, :name, :introduction
  validates :artist_name, presence: true
  validates :name, presence: true
  validates :introduction, presence: true

  # 修正 'Fixed Association'　20190118 ------------
  # has_many :users, through: :users_cummunities
  # ---------------------------------------------
  has_many :users_communities # 追加 'Fixed Association' 20190118
  has_many :users, through: :users_communities
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
