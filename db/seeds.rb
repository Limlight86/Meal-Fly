Category.destroy_all
Recipe.destroy_all
RecipeCategory.destroy_all

categories = [
              {name: 'latin'},
              {name: 'japanese'},
              {name: 'italian'},
              {name: 'comfort food'},
              {name: 'dessert'},
              {name: 'healthy'},
              {name: 'vegan'}
             ]

categories.each { |category| Category.create(category) }

eggs = Recipe.create(
               name: "Fried Eggs",
               cooktime: 10,
               servings: 4,
               difficulty: 1,
               calories: 94,
               carbs: 0,
               protein: 6,
               fat: 5,
               sugar: 0,
               fiber: 0,
               vegan: false,
               gluten_free: true,
               image_url: "https://i.stack.imgur.com/ZuAmS.jpg",
               video_url: "https://i.stack.imgur.com/ZuAmS.mp4"
)

arroz_pollo = Recipe.create(
                name: "Arroz con Pollo",
                cooktime: 60,
                servings: 4,
                difficulty: 2,
                calories: 430,
                carbs: 50,
                protein: 20,
                fat: 16,
                sugar: 1,
                fiber: 2,
                vegan: false,
                gluten_free: true,
                image_url: "https://www.dinneratthezoo.com/wp-content/uploads/2015/05/arroz-con-pollo-4.jpg",
                video_url: "https://www.dinneratthezoo.com/wp-content/uploads/2015/05/arroz-con-pollo-4.mp4"
)

RecipeCategory.create(recipe_id: eggs.id, category_id: Category.comfort_food.id)
RecipeCategory.create(recipe_id: arroz_pollo.id, category_id: Category.comfort_food.id)
RecipeCategory.create(recipe_id: arroz_pollo.id, category_id: Category.latin.id)
#pass IDs to imrove performance

puts "#{Recipe.count} recipes and"
puts "#{Category.count} categories and"
puts "#{RecipeCategory.count} entries in Recipe Category."
