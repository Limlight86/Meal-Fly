class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :servings
      t.integer :difficulty
      t.integer :calories
      t.integer :carbs
      t.integer :protein
      t.integer :fat
      t.integer :sugar
      t.integer :fiber
      t.string :image_url

      t.timestamps
    end
  end
end
