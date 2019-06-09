
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique:true|
|email|string|null:false, unique:true|
|password| string|null:false| 
|self_introduction|text||
|point|integer||

### Association
- has_many :products
- has_many :product_comments
- has_many :likes
- has_many :deal_groups
- has_many :deal_messages
- has_many :notices, dependent: :destroy
- has_many :block_lists, through: :block_lists_users
- has_many :followers, through: :followers_users
- has_many :followers_users
- has_many :rates
- has_one :credit_card_information_list, dependent: :destroy
- has_one :personal_information_list, dependent: :destroy


## personal_information_listsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|family_name(fullwidth)|string|null:false|
|first_name(fullwidth)|string|null:false| 
|family_name_kana (fullwidth)|string|null:false|
|first_name_kana (fullwidth)|string|null:false|
|date_of_birth|string|null: false|
|mobile_phone_number|string|null:false|
|postal_code|string|null:false| 
|prefectures|string|null:false|
|cities|string|null:false|
|address|string|null:false|
|building_name|string||

### Association
- belongs_to :user


## credit_card_information_listsテーブル
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|integer|null: false, unique:true|
|expiration_date(year)|integer|null:false|
|expiration_date(month)|integer|null:false| 
|security_code|integer|null:false|

### Association
- belongs_to :user


## ratesテーブル
|------|----|-------|
|rate_scale|integer|null: false|
|content|text|null: false|
|seller_user_id|references|null:false, foreign_key:true|
|buyer_user_id|references|null:false, foreign_key:true| 

### Association
- belongs_to :seller_user, class_name: "User"
- belongs_to :buyer_user, class_name: "User"
  
 
## followersテーブル
|------|----|-------|

### Association
- has_many :users, through: :followers_users, :dependent: :destroy
- has_many :followers_users

## followers_usersテーブル
|------|----|-------|
|follower_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :user 
-  belongs_to :follower


## deal_groupsテーブル
|------|----|-------|
|seller_user_id|references|null: false, foreign_key:true|
|buyer_user_id|references|null: false, foreign_key:true|
|product_id|references|null: false, foreign_key:true|

### Association
- belongs_to :seller_user, class_name: "User"
- belongs_to :buyer_user, class_name: "User"
- belongs_to :product
- has_many :deal_messages, dependent: :destroy


## deal_messagesテーブル
|------|----|-------|
|deal_group_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
- belongs_to :deal_group


## block_listsテーブル
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|blocked_user_id|references|null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :blocked_user, class_name: "User"

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|seller_user_id|references|null: false, foreign_key:true| 
|category_id|references|null: false, foreign_key:true| 
|brand_id|references|null: false, foreign_key:true|
|product_name|string|null:false|
|shipping_charge|integer|null:false| 
|shipping_method|string|null:false|
|ship_from_location|string|null:false|
|date_before_ship|string|null:false| 
|sales_price|integer|null:false|
|shipping_fee|integer|null:false|
|listing_date|date|null:false| 
|purchase_date|date|null:false|

### Association
- belongs_to :category
- belongs_to :brand
- has_many :product_comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_one :deal_group, dependent: :destroy
- has_many :product_images, dependent: :destroy
- has_one :product_status, dependent: :destroy


## product_statusテーブル
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|status|string|null: false|→下書き、出品中、落札（振込待ち）、振込済み（売上確定）、発送済み、売上振込済み

### Association
-  belongs_to :product

## product_imagesテーブル
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|images|string|null: false|

### Association
-  belongs_to :product


## categoriesテーブル
|------|----|-------|
|name|string|null: false, unique:true|
|parent_id|integer||

### Association
-  has_many :products

## brandsテーブル
|------|----|-------|
|name|string|null: false, unique:true|
|parent_id|integer||

### Association
-  has_many :products


## likesテーブル
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :product
-  belongs_to :user


## product_commentsテーブル
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
-  belongs_to :product
-  belongs_to :user


## noticesテーブル
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
-  belongs_to :user


## newsテーブル
|------|----|-------|
|content|text|null: false|

### Association


