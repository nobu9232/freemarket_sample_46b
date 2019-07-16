class User < ApplicationRecord
  has_one :user_detail, dependent: :destroy
  has_many :products
  has_many :cards
  accepts_nested_attributes_for :user_detail
  has_many :sns_credentials, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]


 
end
