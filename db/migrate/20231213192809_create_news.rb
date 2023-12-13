class CreateNews < ActiveRecord::Migration[7.1]
  def change
    create_table :news do |t|
      t.string :slogan
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :content
      t.references :sections

      t.timestamps
    end
  end
end
