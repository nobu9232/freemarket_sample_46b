class User < ApplicationRecord
  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ##- has_many :products
  ##- has_many :orders


 
end
