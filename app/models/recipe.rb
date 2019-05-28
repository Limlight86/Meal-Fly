class Recipe < ApplicationRecord
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_rich_text :recipe_details

  enum difficulty: { easy: 1, medium: 2, hard: 3 }

  validates :name,
            :servings,
            :difficulty,
            :calories,
            :carbs,
            :protein,
            :fat,
            :sugar,
            :fiber,
            :image_url,
            :recipe_details,
            :video_url,
            :cook_time,
            presence: true
end
