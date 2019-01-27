class Community < ApplicationRecord

  #include ActiveModel::Model
  #attr_accessor :artist_name, :name, :introduction, :artist_id, :is_active
  #validates :artist_name, presence: true
  #validates :name, presence: true
  #validates :introduction, presence: true
  
  # 修正 'Fixed Association'　20190118 ------------
  # has_many :users, through: :users_cummunities
  # ---------------------------------------------
  has_many :users_communities # 追加 'Fixed Association' 20190118
  has_many :users, through: :users_communities
  has_many :board_comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :artist

  attachment :image
  validate :artist_name_exist_in_database
  attribute :artist_name

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
    if artist_id == 0
      errors.add(:artist_id, ": このアーティスト名は使用できません。正しいアーティスト名を入力するか、アーティスト名を追加してください。")
    end
  end
end
