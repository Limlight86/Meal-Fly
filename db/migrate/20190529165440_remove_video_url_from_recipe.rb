class RemoveVideoUrlFromRecipe < ActiveRecord::Migration[6.0]
  def change

    remove_column :recipes, :video_url, :string
  end
end
