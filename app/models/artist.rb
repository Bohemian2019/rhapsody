class Artist < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :artist_name, presence: true
  validate :artist_name_not_in_database

  # Custom validation
  def artist_name_not_in_database
    if Artist.exists?(artist_name: artist_name)
      errors.add(:artist_name, ": このアーティスト名はすでに登録されています。")
    end
  end
end
