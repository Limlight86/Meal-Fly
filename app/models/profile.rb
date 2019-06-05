class Profile < ApplicationRecord
  enum skill_level: { novice: 1, intermediate: 2, expert: 3 }
  validates :skill_level, presence: true

  has_many :profile_categories
  has_many :categories, through: :profile_categories

  belongs_to :user, optional: true
  
  def skill_levels
    levels = Profile.skill_levels 
    levels.select{|k,v| v <= levels[skill_level]}
  end
end
