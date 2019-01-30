class Item < ApplicationRecord
  attribute :artist_name
  attribute :label_name

  has_many :shopping_carts, through: :cart_items
  has_many :cart_items, dependent: :destroy
  has_many :songs
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
  belongs_to :artist
  belongs_to :label

  attachment :image

  validate :artist_name_exist_in_database
  validate :label_name_exist_in_database
  validates :item_name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :genre, presence: true
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Search method
  def self.search(keyword)
    if keyword
      relation = Item.joins(:artist)
      relation.merge(Artist.where(['artist_name LIKE ?', "%#{keyword}%"])).or(relation.where(['item_name LIKE ?', "%#{keyword}%"]))
    else
      Item.all
    end
  end

  # Custom validation
  def artist_name_exist_in_database
    if artist_id == 0
      errors.add(:artist_id, ": このアーティスト名は使用できません。正しいアーティスト名を入力するか、アーティスト名を追加してください。")
    end
  end

  def label_name_exist_in_database
    if label_id == 0
      errors.add(:label_id, ": このレーベル名は使用できません。正しいレーベル名を入力するか、レーベル名を追加してください。")
    end
  end
end
