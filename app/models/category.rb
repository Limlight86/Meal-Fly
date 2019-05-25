class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories

  class << self #doing this makes it so that it only needs to refer the DB once and then saves it, improves performance.
    def latin
      @latin ||= find_by(name: "latin")
    end

    def japanese
      @japanese ||= find_by(name: "japanese")
    end

    def italian
      @italian ||= find_by(name: "italian")
    end

    def comfort_food
      @comfort_food ||= find_by(name: "comfort food")
    end

    def dessert
      @dessert ||= find_by(name: "dessert")
    end

    def healthy
      @healthy ||= find_by(name: "healthy")
    end

    def vegan
      @vegan ||= find_by(name: "vegan")
    end

  end

end
