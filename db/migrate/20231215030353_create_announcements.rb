class CreateAnnouncements < ActiveRecord::Migration[7.1]
  def change
    create_table :announcements do |t|
      t.references :section
      t.boolean :is_enabled, default: false
      t.boolean :is_global, default: false
      t.string :customer_name
      t.string :customer_url
      # (pending) image uploader

      t.timestamps
    end
  end
end
