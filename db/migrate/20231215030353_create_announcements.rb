class CreateAnnouncements < ActiveRecord::Migration[7.1]
  def change
    create_table :announcements do |t|
      t.string :customer_name
      t.string :customer_url

      t.timestamps
    end
  end
end
