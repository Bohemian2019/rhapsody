class CommunityRequestForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :artist_name, :string
  attribute :name, :string
  attribute :introduction

end
