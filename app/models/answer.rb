class Answer < ApplicationRecord

validates :answer, length: { in: 1..500 }
validates :answer, presence: true

belongs_to :question
belongs_to :user

end
