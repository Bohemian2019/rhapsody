# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User data
User.create(
  [
    {
      :name => '阿部',
      :name_kana => 'アベ',
      :introduction => 'Hello',
      :postal_code => '1234567',
      :address => '東京都渋谷区',
      :phone_number => '09008080707',
      :email => 'ageage@agege.com',
      :password => 'piyopiyo',
      :point => '3',
      :is_active => 'TRUE',
      :admin => 'FALSE'
    },
    {
      :name => 'Taro Yamada',
      :name_kana => 'ヤマダタロウ',
      :introduction => 'I\'m Taro.',
      :postal_code => '1111111',
      :address => '東京都文京区',
      :phone_number => '09012312312',
      :email => 'taro@test.com',
      :password => 'password',
      :point => '5',
      :is_active => 'TRUE',
      :admin => 'FALSE'
    },
    {
      :name => 'John Smith',
      :name_kana => 'ジョンスミス',
      :introduction => 'Hi',
      :postal_code => '0000000',
      :address => '神奈川県横浜市',
      :phone_number => '09012341234',
      :email => 'johnsmith@example.com',
      :password => 'password',
      :point => '',
      :is_active => 'TRUE',
      :admin => 'TRUE'
    },
    {
      :name => 'Ichiro Yamada',
      :name_kana => 'ヤマダイチロウ',
      :introduction => 'I\'m Ichiro.',
      :postal_code => '1111111',
      :address => '東京都文京区',
      :phone_number => '09012425312',
      :email => 'ichiro@test.com',
      :password => 'password',
      :point => '512',
      :is_active => 'TRUE',
      :admin => 'FALSE'
    },
    {
      :name => 'Jiro Yamada',
      :name_kana => 'ヤマダジロウ',
      :introduction => 'I\'m Jiro.',
      :postal_code => '1111111',
      :address => '東京都文京区',
      :phone_number => '09012664312',
      :email => 'jiro@test.com',
      :password => 'password',
      :point => '132',
      :is_active => 'TRUE',
      :admin => 'FALSE'
    },
    {
      :name => 'Sabu Yamada',
      :name_kana => 'ヤマダサブ',
      :introduction => 'I\'m Sabu.',
      :postal_code => '1111111',
      :address => '東京都文京区',
      :phone_number => '09012312312',
      :email => 'sabu@test.com',
      :password => 'password',
      :point => '12',
      :is_active => 'TRUE',
      :admin => 'FALSE'
    },
  ]
)

# Artist data
Artist.create(
  [
    {:artist_name => 'Mr.Children'},
    {:artist_name => 'Robert Glasper'},
    {:artist_name => 'Queen'},
    {:artist_name => 'Led Zeppelin'},
    {:artist_name => 'Rolling Stones'},
    {:artist_name => 'Red Hot Chili Peppers'}
  ]
)

# Label data
Label.create(
  [
    {:label_name => 'Infratop'},
    {:label_name => 'Bluenote'}
  ]
)

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

# Item data
Item.create(
  [
    {
      :artist_id => '1',
      :item_name => 'lalala',
      :price => '100',
      :label_id => '1',
      :genre => 'j-pop',
      :stock => '2'
    },
    {
      :artist_id => '2',
      :item_name => 'Black Radio',
      :price => '1980',
      :label_id => '2',
      :genre => 'jazz',
      :stock => '1000'
    },
    {
      :artist_id => '3',
      :item_name => 'Jewels',
      :price => '1500',
      :label_id => '1',
      :genre => 'rock',
      :stock => '210'
    },
    {
      :artist_id => '2',
      :item_name => 'Black Radio 2',
      :price => '1980',
      :label_id => '2',
      :genre => 'jazz',
      :stock => '1000'
    },
    {
      :artist_id => '2',
      :item_name => 'ArtScience',
      :price => '1580',
      :label_id => '2',
      :genre => 'jazz',
      :stock => '1000'
    },
    {
      :artist_id => '3',
      :item_name => 'Greatest Hits',
      :price => '2080',
      :label_id => '2',
      :genre => 'Rock',
      :stock => '10'
    },
  ]
)

Song.create(
  [
    {:item_id => '1',:disc_number => '1',:song_number => '1',:name => 'lalala'},
    {:item_id => '1',:disc_number => '2',:song_number => '1',:name => 'gogogo'},
    {:item_id => '2',:disc_number => '1',:song_number => '1',:name => 'kokoko'},

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
    {:shopping_cart_id => '3',:item_id => '3',:price => '300',:quantity => '2'},
    {:shopping_cart_id => '4',:item_id => '2',:price => '300',:quantity => '2'},
    {:shopping_cart_id => '5',:item_id => '4',:price => '200',:quantity => '2'},
    {:shopping_cart_id => '6',:item_id => '1',:price => '100',:quantity => '2'},
  ]
)

Community.create(:name => 'Mr.Children',:artist_id => '1',:introduction => 'Hello',:is_active => 'TRUE')
Community.create(:name => 'Robert Glasper',:artist_id => '2',:introduction => 'Hi',:is_active => 'TRUE')
Community.create(:name => 'Queen',:artist_id => '3',:introduction => 'Hey',:is_active => 'TRUE')
Community.create(:name => 'Led Zeppelin',:artist_id => '4',:introduction => 'Hey',:is_active => 'TRUE')
Community.create(:name => 'Rolling Stones',:artist_id => '5',:introduction => 'Hey',:is_active => 'TRUE')
Community.create(:name => 'RHCP',:artist_id => '6',:introduction => 'Hey',:is_active => 'TRUE')

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



