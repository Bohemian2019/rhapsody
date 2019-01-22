class Community < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :artist_name, :name, :introduction
  validates :artist_name, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :artist_name_exist_in_database, presence: true

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

  # Custom validation
  def artist_name_exist_in_database
    if Artist.exists?(artist_name: artist_name)
      return true
    else
      errors.add(:artist_name, ": このアーティスト名は使用できません。正しいアーティスト名を入力するか、アーティスト名を追加してください。")
    end
  end
end
