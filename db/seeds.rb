Category.destroy_all
Recipe.destroy_all
RecipeCategory.destroy_all

user = User.create(email: "some@guy.com", password: "password", username: "someguy123")
admin = User.create(email: "admin@gmail.com", password: "redfred", admin: true, username: "admin")

categories  = [
                {name: 'Latin'},
                {name: 'Japanese'},
                {name: 'Italian'},
                {name: 'Comfort food'},
                {name: 'Dessert'},
                {name: 'Healthy'},
                {name: 'Vegan'},
                {name: 'Gluten-free'}
              ]

categories.each { |category| Category.create(category) }

eggs = Recipe.create(
  name:           "Fried Eggs",
  cook_time:      10,
  servings:       4,
  difficulty:     "novice",
  calories:       94,
  carbs:          0,
  protein:        6,
  fat:            5,
  sugar:          0,
  fiber:          0,
  recipe_ingredients: "Ingredients go here <============",
  recipe_instructions: "Cook the food....doesnt get much easier than this!"
)

arroz_pollo = Recipe.create(
  name:           "Arroz con Pollo",
  cook_time:      60,
  servings:       4,
  difficulty:     "intermediate",
  calories:       430,
  carbs:          50,
  protein:        20,
  fat:            16,
  sugar:          1,
  fiber:          2,
  recipe_ingredients: "Ingredients go here <============",
  recipe_instructions: "Cook the food. Comer la comida!"
)

ramen = Recipe.create(
  name:           "Tonkatsu Ramen",
  cook_time:      40,
  servings:       4,
  difficulty:     "intermediate",
  calories:       250,
  carbs:          40,
  protein:        21,
  fat:            33,
  sugar:          3,
  fiber:          10,
  recipe_ingredients: "Ingredients go here <============",
  recipe_instructions: "Cook the food, Enjoy the food! Slurp it down!"
)

lasgna = Recipe.create(
  name:           "100 layer Lasgna",
  cook_time:      240,
  servings:       20,
  difficulty:     "expert",
  calories:       762,
  carbs:          43,
  protein:        52,
  fat:            34,
  sugar:          14,
  fiber:          5,
  recipe_ingredients: "Ingredients go here <============",
  recipe_instructions: "Cook the food, Enjoy the food!...Thats alot of pasta!"
)

tofu_nuggets = Recipe.create(
  name:           "Popcorn Tofu Nuggets",
  cook_time:      90,
  servings:       6,
  difficulty:     "intermediate",
  calories:       231,
  carbs:          18,
  protein:        10,
  fat:            22,
  sugar:          1,
  fiber:          2,
  recipe_ingredients: "Ingredients go here <============",
  recipe_instructions: "Cook the food, Enjoy the food!...These look real good!"
)

cinnamon_rolls = Recipe.create(
  name:           "Vegan Gluten-free Cinnamon Rolls",
  cook_time:      75,
  servings:       4,
  difficulty:     "intermediate",
  calories:       406,
  carbs:          57,
  protein:        6,
  fat:            19,
  sugar:          28,
  fiber:          5,
  recipe_ingredients: "Ingredients go here <============",
  recipe_instructions: "Cook the food, Enjoy the food!...No animals were harmed in the making of this recipe!"
)

RecipeCategory.create(recipe: eggs, category: Category.find_by(name: "Comfort food"))
RecipeCategory.create(recipe: arroz_pollo, category: Category.find_by(name: "Comfort food"))
RecipeCategory.create(recipe: arroz_pollo, category: Category.find_by(name: "Latin"))
RecipeCategory.create(recipe: ramen, category: Category.find_by(name: "Japanese"))
RecipeCategory.create(recipe: lasgna, category: Category.find_by(name: "Italian"))
RecipeCategory.create(recipe: lasgna, category: Category.find_by(name: "Comfort food"))
RecipeCategory.create(recipe: tofu_nuggets, category: Category.find_by(name: "Comfort food"))
RecipeCategory.create(recipe: tofu_nuggets, category: Category.find_by(name: "Healthy"))
RecipeCategory.create(recipe: tofu_nuggets, category: Category.find_by(name: "Vegan"))
RecipeCategory.create(recipe: cinnamon_rolls, category: Category.find_by(name: "Vegan"))
RecipeCategory.create(recipe: cinnamon_rolls, category: Category.find_by(name: "Dessert"))
RecipeCategory.create(recipe: cinnamon_rolls, category: Category.find_by(name: "Gluten-free"))

UserRecipe.create(recipe: arroz_pollo, user: user)
UserRecipe.create(recipe: lasgna, user: user)
UserRecipe.create(recipe: tofu_nuggets, user: user)

puts "#{Recipe.count} recipes and"
puts "#{Category.count} categories and"
puts "#{RecipeCategory.count} entries in Recipe Category."
puts "#{UserRecipe.count} recipes saved in User's cookbook."