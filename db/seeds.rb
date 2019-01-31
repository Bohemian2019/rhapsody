# Setting for spotify-api authentication
#require 'rspotify'
#require 'dotenv'
#Dotenv.load
#RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])

# Load seed file from seeds/
require './db/seeds/user.rb'
require './db/seeds/album.rb'

# ShoppingCart data
ShoppingCart.create(
  [
    {:user_id => '1',:is_active => 'TRUE'},
    {:user_id => '2',:is_active => 'TRUE'},
    {:user_id => '3',:is_active => 'TRUE'},
    {:user_id => '4',:is_active => 'TRUE'},
    {:user_id => '5',:is_active => 'TRUE'},
    {:user_id => '6',:is_active => 'TRUE'},
  ]
)

CartItem.create(
  [
    {:shopping_cart_id => '1',:item_id => '1',:price => '100',:quantity => '1'},
    {:shopping_cart_id => '1',:item_id => '2',:price => '200',:quantity => '2'},
    {:shopping_cart_id => '2',:item_id => '1',:price => '100',:quantity => '2'},
    {:shopping_cart_id => '2',:item_id => '4',:price => '100',:quantity => '2'},
    {:shopping_cart_id => '3',:item_id => '6',:price => '300',:quantity => '2'},
    {:shopping_cart_id => '4',:item_id => '2',:price => '300',:quantity => '2'},
    {:shopping_cart_id => '5',:item_id => '5',:price => '200',:quantity => '2'},
    {:shopping_cart_id => '6',:item_id => '1',:price => '100',:quantity => '2'},
  ]
)

Community.create(:name => 'Mr.Children',:artist_id => '1',:introduction => 'Hello',:is_active => 'TRUE', :artist_name => "", :community_image => "no-user-image.jpg")
Community.create(:name => 'Robert Glasper',:artist_id => '2',:introduction => 'Hi',:is_active => 'TRUE',:community_image => "no-user-image.jpg")
Community.create(:name => 'Queen',:artist_id => '3',:introduction => 'Hey',:is_active => 'TRUE', :community_image => "af2b8e57f6d7b5d43a616bd1e27ba552cd8bfd42.jpg")
Community.create(:name => 'Anderson Paak',:artist_id => '4',:introduction => 'Hey',:is_active => 'TRUE', :community_image => "ccaa5c3eb7d08ca020aa964c993bbe314e3a4bf3.jpg")
Community.create(:name => 'Radiohead',:artist_id => '5',:introduction => 'Hey',:is_active => 'TRUE', :community_image => "no-user-image.jpg")
Community.create(:name => 'Imagine Dragons',:artist_id => '6',:introduction => 'Hey',:is_active => 'TRUE', :community_image => "ff8d83627cb2a80d4c1fa36fd80a193ca34b7a50.jpg")

Question.create(:community_id => '1',:user_id => '1',:question => 'YES?')

Answer.create(:question_id => '1',:user_id => '1',:answer => 'YES')

BoardComment.create(:community_id => '1',:user_id =>'1',:comment => 'Hello')

#UsersCommunity.create(:user_id => '1',:community_id => '1')

CreditCard.create(:user_id => '1',:name => 'Abe',:card_number => '123456789',:month => '11',:year => '20')

Subscription.create(:user_id => '1',:artist_id => '1')

# Order data
Order.create(
  [
    {
      :shopping_cart_id => '1',
      :payment => '2',
      :status => '1',
      :postal_code => '1234567',
      :address => '東京都渋谷区'
    },
    {
      :shopping_cart_id => '2',
      :payment => '2',
      :status => '1',
      :postal_code => '1234567',
      :address => '東京都渋谷区'
    },
    {
      :shopping_cart_id => '3',
      :payment => '2',
      :status => '1',
      :postal_code => '1234567',
      :address => '東京都渋谷区'
    },
    {
      :shopping_cart_id => '4',
      :payment => '2',
      :status => '2',
      :postal_code => '1234567',
      :address => '東京都渋谷区'
    },
    {
      :shopping_cart_id => '5',
      :payment => '2',
      :status => '1',
      :postal_code => '1234567',
      :address => '東京都渋谷区'
    },
    {
      :shopping_cart_id => '6',
      :payment => '2',
      :status => '2',
      :postal_code => '1234567',
      :address => '東京都渋谷区'
    },
  ]
)

Administrator.create(
      :email => 'admin@admin.com',
      :password => 'administrator',
      :is_active => 'TRUE',
      :admin => 'TRUE'
    )



