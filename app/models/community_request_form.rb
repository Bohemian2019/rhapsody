class CommunityRequestForm
  include ActiveModel::Model
  attr_accessor :artist_name, :name, :introduction
  validates :artist_name, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :artist_name_exist_in_database, presence:true


  # Custom validation
  def artist_name_exist_in_database
    if Artist.exists?(artist_name: artist_name)
      return true
    else
      errors.add(:artist_name, ": このアーティスト名は使用できません。正しいアーティスト名を入力するか、アーティスト名を追加してください。")
    end
  end
end
