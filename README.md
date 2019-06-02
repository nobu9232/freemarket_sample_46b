# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
- has_many :transaction_groups, through: :transaction_groups_users
- has_many :transaction_groups_users
- has_many :transacrion_messages
- has_many :notices
- has_many :block_lists, through: :block_lists_users
- has_many :followers, through: :followers_users
- has_many :followers_users
- has_many :rates
- has_many :notices
- has_one :credit_card_information_lists
- has_one :personal_information_lists


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
|first_name_kana (fullwidth)|string|null:false|

### Association
- belongs_to :user


## ratesテーブル
|------|----|-------|
|rate_scale|integer|null: false|
|content|text|null: false|
|seller_user_id|references|null:false,
foreign_key:true, foreign_key:true|
|buyer_user_id|references|null:false, foreign_key:true| 

### Association
- belongs_to :seller_user, class_name: "User"
- belongs_to :buyer_user, class_name: "User"
  
 
## followersテーブル
|------|----|-------|

### Association
- has_many :users, through: :followers_users
- has_many :followers_users

## followers_usersテーブル
|------|----|-------|
|follower_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :user 
-  belongs_to :follower


## transaction_groupsテーブル
|------|----|-------|
|seller_user_id|references|null: false, foreign_key:true|
|buyer_user_id|references|null: false, foreign_key:true|
|product_id|references|null: false, foreign_key:true|

### Association
- belongs_to :seller_user, class_name: "User"
- belongs_to :buyer_user, class_name: "User"
- belongs_to :product


## transaction_messagesテーブル
|------|----|-------|
|transaction_group_id|references|null: false, foreign_key:true|
|seller_user_id|references|null: false, foreign_key:true|
|buyer_user_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
- belongs_to :seller_user, class_name: "User"
- belongs_to :buyer_user, class_name: "User"
- belongs_to :transaciton_group


## transaction_groups_usersテーブル
|------|----|-------|
|transaction_group_id|references|null: false, foreign_key:true|
|seller_user_id|references|null: false, foreign_key:true| 
|buyer_user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :transaction_group
- belongs_to :seller_user, class_name: "User"
- belongs_to :buyer_user, class_name: "User"


## block_listsテーブル
|------|----|-------|

### Association
- has_many :users, through: :block_lists_users
- has_many :block_lists_users

## block_lists_usersテーブル
|------|----|-------|
|block_lists_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :user 
-  belongs_to :block_lists

## productsテーブル○

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
- has_many :product_comments
- has_many :likes
- has_many :transaction_groups, through: :transaction_groups_users
- has_many :transaction_groups_users
- has_many :transacrion_messages
- has_many :product_images
- has_one :product_status
- has_one :product_orders


## product_statusテーブル◯
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|status|string|null: false|→下書き、出品中、落札（振込待ち）、振込済み（売上確定）、発送済み、売上振込済み

### Association
-  belongs_to :product


## ordersテーブル
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|seller_user_id|references|null: false, foreign_key:true| 
|buyer_user_id|references|null: false, foreign_key:true|

### Association
- belongs_to :seller_user, class_name: "User"
- belongs_to :buyer_user, class_name: "User"
-  belongs_to :product

## product_imagesテーブル○
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|images|string|null: false|

### Association
-  belongs_to :product


## categoriesテーブル○
|------|----|-------|
|category_name|string|null: false, unique:true|
|parent_id|integer||

### Association
-  has_many :products

## brandsテーブル○
|------|----|-------|
|brand_name|string|null: false, unique:true|
|parent_id|integer||

### Association
-  has_many :products


## likesテーブル○
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :product
-  belongs_to :user


## product_commentsテーブル○
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
-  belongs_to :product
-  belongs_to :user


## noticesテーブル○
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
-  belongs_to :user


## newsテーブル○
|------|----|-------|
|content|text|null: false|

### Association