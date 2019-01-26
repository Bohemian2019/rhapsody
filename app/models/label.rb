class Label < ApplicationRecord

  # 削除　'Fixed Association'　20190118-------
  # has_many :labels, dependent: :destroy
  has_many :items, dependent: :destroy
  # ---------------------------------------


  validates :label_name, presence: true
  validate :label_name_not_in_database

  # Custom validation
  def label_name_not_in_database
    if Label.exists?(label_name: label_name)
      errors.add(:label_name, ": このレーベル名はすでに登録されています。")
    end
  end
end
