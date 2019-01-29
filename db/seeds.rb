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
    {:shopping_cart_id => '1',:item_id => '3',:price => '250',:quantity => '3'},
    {:shopping_cart_id => '2',:item_id => '1',:price => '100',:quantity => '2'},
    {:shopping_cart_id => '2',:item_id => '2',:price => '100',:quantity => '2'},
    {:shopping_cart_id => '2',:item_id => '3',:price => '100',:quantity => '2'},
    {:shopping_cart_id => '2',:item_id => '4',:price => '100',:quantity => '2'},
    {:shopping_cart_id => '3',:item_id => '6',:price => '300',:quantity => '2'},
    {:shopping_cart_id => '4',:item_id => '2',:price => '300',:quantity => '2'},
    {:shopping_cart_id => '5',:item_id => '5',:price => '200',:quantity => '2'},
    {:shopping_cart_id => '6',:item_id => '1',:price => '100',:quantity => '2'},
  ]
)

Community.create(:name => 'Mr.Children',:artist_id => '1',:introduction => 'Hello',:is_active => 'TRUE', :artist_name => "")
Community.create(:name => 'Robert Glasper',:artist_id => '2',:introduction => 'Hi',:is_active => 'TRUE')
Community.create(:name => 'Queen',:artist_id => '3',:introduction => 'Hey',:is_active => 'TRUE')
Community.create(:name => 'Anderson Paak',:artist_id => '4',:introduction => 'Hey',:is_active => 'TRUE')
Community.create(:name => 'Radionhead',:artist_id => '5',:introduction => 'Hey',:is_active => 'TRUE')
Community.create(:name => 'Imagine Dragons',:artist_id => '6',:introduction => 'Hey',:is_active => 'TRUE')
Community.create(:name => 'Bruno Mars',:artist_id => '6',:introduction => 'Hey',:is_active => 'TRUE')

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
      :payment => '1',
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
      :payment => '1',
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
      :payment => '1',
      :status => '1',
      :postal_code => '1234567',
      :address => '東京都渋谷区'
    },
    {
      :shopping_cart_id => '6',
      :payment => '1',
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



