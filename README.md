
## usersテーブル 必須

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique:true|
|email|string|null:false, unique:true|
|password|string|null:false| 
|self_introduction|text||
|point|integer||

### Association
- has_many :products
- has_many :product_comments
- has_many :likes
- has_many :orders
- has_many :transaction_messages
- has_many :notices, dependent: :destroy
- has_many :block_lists, through: :block_lists_users
- has_many :followers, through: :followers_users
- has_many :followers_users
- has_many :rates
- has_one :credit_card_information_list, dependent: :destroy
- has_one :personal_information_list, dependent: :destroy


## user_detailsテーブル 必須

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|family_name(fullwidth)|string|null:false|
|first_name(fullwidth)|string|null:false| 
|family_name_kana (fullwidth)|string|null:false|
|first_name_kana (fullwidth)|string|null:false|
|date_of_birth|date|null: false|
|phone_number|string|null:false|
|postal_code|string|null:false| 
|prefecture|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building_name|string||

### Association
- belongs_to :user


## credit_card_information_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|integer|null: false, unique:true|
|expiration_date(year)|integer|null:false|
|expiration_date(month)|integer|null:false| 
|security_code|integer|null:false|

### Association
- belongs_to :user


## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rate_scale|integer|null: false|
|content|text|null: false|
|seller_user_id|references|null:false, foreign_key:true|
|buyer_user_id|references|null:false, foreign_key:true| 

### Association
- belongs_to :seller_user, class_name: "User"
- belongs_to :buyer_user, class_name: "User"
  
 
## followersテーブル
|Column|Type|Options|
|------|----|-------|

### Association
- has_many :users, through: :followers_users, :dependent: :destroy
- has_many :followers_users

## followers_usersテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :user 
-  belongs_to :follower


## deal_groupsテーブル
|Column|Type|Options|
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
|Column|Type|Options|
|------|----|-------|
|deal_group_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
- belongs_to :deal_group


## block_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|blocked_user_id|references|null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :blocked_user, class_name: "User"

## productsテーブル 必須

|Column|Type|Options|
|------|----|-------|
|seller_user_id|integer|null: false, foreign_key:true|
|buyer_user_id|integer|foreign_key:true|
|name|string|null:false, index: true|
|text|text|null:false|
|condition|string|null:false|
|sales_price|integer|null:false|
|size|string||
|brand_id|references|foreign_key:true|
|shipping_charge|integer|null:false| 
|shipping_method|string|null:false|
|ship_from_location|string|null:false|
|shipping_days|string|null:false| 
|purchase_date|date||
|status|string|null: false|
  <!-- enum status: { "draft":0, "exhibition":1, "bid":2, "transferred":3, "sent":4}とする -->



### Association
- belongs_to :user
- has_many :categories, through: :products_categories, dependent: :destroy
- has_many :products_categories
- belongs_to :brand
<!-- - has_many :likes, dependent: :destroy 今回不要-->
- has_one :order, dependent: :destroy
- has_many :product_images, dependent: :destroy
- has_one :product_status, dependent: :destroy

## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|images|string|null: false|

### Association
-  belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true|
|parent_id|integer||

### Association
- has_many :products, through: :products_categories, dependent: :destroy
- has_many :products_categories



## products_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|category_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :product
-  belongs_to :category


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique:true|
|parent_id|integer||

### Association
-  has_many :products


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|

### Association
-  belongs_to :product
-  belongs_to :user


## product_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key:true|
|user_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
-  belongs_to :product
-  belongs_to :user


## noticesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|content|text|null: false|

### Association
-  belongs_to :user


## newsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|

### Association


