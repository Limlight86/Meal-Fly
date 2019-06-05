class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :user_recipes, dependent: :destroy
  has_many :recipes, through: :user_recipes
  has_one :profile

  validates :username, presence: true, uniqueness: true
end
