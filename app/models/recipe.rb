class Recipe < ApplicationRecord
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :user_recipes, dependent: :destroy
  has_rich_text :recipe_details
  has_one_attached :image
  has_one_attached :video

  include SearchableByName

  enum difficulty: { Novice: 1, Intermediate: 2, Expert: 3 }

  validates :name,
            :servings,
            :difficulty,
            :calories,
            :carbs,
            :protein,
            :fat,
            :sugar,
            :fiber,
            :recipe_details,
            :cook_time,
            presence: true

  scope :ordered, -> { order(name: :asc) }
end
