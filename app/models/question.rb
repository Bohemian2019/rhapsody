class Question < ApplicationRecord

has_many :answers, dependent: :destroy
belongs_to :community
belongs_to :user

end
