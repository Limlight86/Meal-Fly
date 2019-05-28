class Category < ApplicationRecord
  has_many :recipe_categories, dependent: :destroy
  has_many :recipes, through: :recipe_categories

  validates :name, presence: true, uniqueness: true
end
