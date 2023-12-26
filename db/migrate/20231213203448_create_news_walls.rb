class CreateNewsWalls < ActiveRecord::Migration[7.1]
  def change
    create_table :news_walls do |t|
      t.string :slogan
      t.string :title
      t.string :subtitle
      t.string :author
      t.text :content
      t.references :section

      t.timestamps
    end
  end
end
