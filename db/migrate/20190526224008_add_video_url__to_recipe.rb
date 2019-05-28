class AddVideoUrlToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :video_url, :string
  end
end
