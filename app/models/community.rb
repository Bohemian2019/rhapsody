class Community < ApplicationRecord

has_many :users_cummunities, dependent: :destroy
has_many :board_comments, dependent: :destroy
has_many :questions, dependent: :destroy

end
