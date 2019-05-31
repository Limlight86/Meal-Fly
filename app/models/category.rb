class Category < ApplicationRecord
  has_many :recipe_categories, dependent: :destroy
  has_many :recipes, through: :recipe_categories

  include SearchableByName

  validates :name, presence: true, uniqueness: true
end
