class Recipe < ApplicationRecord
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :user_recipes, dependent: :destroy
  has_rich_text :recipe_ingredients
  has_rich_text :recipe_instructions
  has_one_attached :image
  has_one_attached :video

  include SearchableByName

  enum difficulty: { novice: 1, intermediate: 2, expert: 3 }

  validates :name,
            :servings,
            :difficulty,
            :calories,
            :carbs,
            :protein,
            :fat,
            :sugar,
            :fiber,
            :recipe_ingredients,
            :recipe_instructions,
            :cook_time,
            presence: true

  scope  :ordered,      ->  { order(name: :asc) }
  scope  :for_profile,  ->  (profile){
                              joins(recipe_categories: :category)
                                .where(categories: { id: profile.categories })
                                .where(difficulty: profile.skill_levels.keys)
                            }
end
