class CreateRecipeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_categories do |t|
      t.references :recipe
      t.references :category

      t.timestamps
    end
  end
end
