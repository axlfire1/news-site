class AddImageToNewsWall < ActiveRecord::Migration[7.1]
  def change
    add_column :news_walls, :image, :string
  end
end
