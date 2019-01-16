# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:name => '阿部' ,:name_kana => 'アベ' ,:introduction => 'Hello',:postal_code => '1234567',:address => '東京都渋谷区',:phone_number => '09008080707',:email => 'ageage@agege.com',:password => 'piyopiyo',:point => '3',:is_active => 'TRUE',:admin => 'FALSE')

Artist.create(:artist_name => 'Mr.Children')
Label.create(:label_name => 'Infratop')
ShoppingCart.create(:user_id => '1',:is_active => 'TRUE')
Item.create(:artist_id => '1',:item_name => 'lalala',:price => '100',:label_id => '1',:genre => 'j-pop',:stock => '2')
Song.create(:item_id => '1',:disc_number => '1',:song_number => '1',:name => 'lalala')


CartItem.create(:shopping_cart_id => '1',:item_id => '1',:price => '100',:quantity => '2')

Community.create(:name => 'Mr.Children',:artist_id => '1',:introduction => 'Hello',:is_active => 'TRUE')

Question.create(:community_id => '1',:user_id => '1',:question => 'YES?')

Answer.create(:question_id => '1',:user_id => '1',:answer => 'YES')

BoardComment.create(:community_id => '1',:user_id =>'1',:comment => 'Hello')

UsersCommunity.create(:user_id => '1',:community_id => '1')

CreditCard.create(:user_id => '1',:name => 'Abe',:card_number => '123456789',:month => '11',:year => '20')

Subscription.create(:user_id => '1',:artist_id => '1')

Order.create(:shopping_cart_id => '1',:payment => '1',:status => '1',:postal_code => '1234567',:address => '東京都渋谷区')



