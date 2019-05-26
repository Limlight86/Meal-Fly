class AddCooktimeToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :cooktime, :integer
  end
end
