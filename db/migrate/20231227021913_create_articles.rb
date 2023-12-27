class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :image
      t.string :title
      t.string :author
      t.text :content
      t.string :social_media_contact
      t.text :foot_note

      t.timestamps
    end
  end
end
