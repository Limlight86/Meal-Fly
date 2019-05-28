Category.destroy_all
Recipe.destroy_all
RecipeCategory.destroy_all

categories  = [
                {name: 'latin'},
                {name: 'japanese'},
                {name: 'italian'},
                {name: 'comfort food'},
                {name: 'dessert'},
                {name: 'healthy'},
                {name: 'vegan'},
                {name: 'gluten free'}
              ]

categories.each { |category| Category.create(category) }

eggs = Recipe.create(
  name:           "Fried Eggs",
  cook_time:      10,
  servings:       4,
  difficulty:     "easy",
  calories:       94,
  carbs:          0,
  protein:        6,
  fat:            5,
  sugar:          0,
  fiber:          0,
  image_url:      "https://i.stack.imgur.com/ZuAmS.jpg",
  video_url:      "https://i.stack.imgur.com/ZuAmS.mp4",
  recipe_details: "Cook the food"
)

arroz_pollo = Recipe.create(
  name:           "Arroz con Pollo",
  cook_time:      60,
  servings:       4,
  difficulty:     "medium",
  calories:       430,
  carbs:          50,
  protein:        20,
  fat:            16,
  sugar:          1,
  fiber:          2,
  image_url:      "https://www.dinneratthezoo.com/wp-content/uploads/2015/05/arroz-con-pollo-4.jpg",
  video_url:      "https://www.dinneratthezoo.com/wp-content/uploads/2015/05/arroz-con-pollo-4.mp4",
  recipe_details: "Cook the food"
)

RecipeCategory.create(recipe: eggs, category: Category.find_by(name: "comfort food"))
RecipeCategory.create(recipe: arroz_pollo, category: Category.find_by(name: "comfort food"))
RecipeCategory.create(recipe: arroz_pollo, category: Category.find_by(name: "latin"))

puts "#{Recipe.count} recipes and"
puts "#{Category.count} categories and"
puts "#{RecipeCategory.count} entries in Recipe Category."
