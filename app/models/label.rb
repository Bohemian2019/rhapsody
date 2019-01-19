class Label < ApplicationRecord

  # 削除　'Fixed Association'　20190118-------
  # has_many :labels, dependent: :destroy
  has_many :items, dependent: :destroy
  # ---------------------------------------




end
