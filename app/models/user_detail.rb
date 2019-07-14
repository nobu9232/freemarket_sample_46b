class UserDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :prefecture, class_name: "Prefecture", foreign_key: "prefecture_id"
end
