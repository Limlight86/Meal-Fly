class RemoveImageUrlFromRecipe < ActiveRecord::Migration[6.0]
  def change

    remove_column :recipes, :image_url, :string
  end
end
