# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env == 'development'
  Section.delete_all
  AdminUser.delete_all
  NewsWall.delete_all
  Announcement.delete_all

  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 0) 
  AdminUser.create!(email: 'publisher1@example.com', password: 'password', password_confirmation: 'password', role: 1) 
  AdminUser.create!(email: 'publisher2@example.com', password: 'password', password_confirmation: 'password', role: 1) 

  section = Section.create!(name: 'police')
  100.times do |iterator|
    NewsWall.create!(
      slogan: "my eslogan",
      title: "mytile_#{iterator}",
      subtitle: "mysubtitle",
      author: "my_author",
      content: "my_content",
      section: section
    )

    Announcement.create!(
      section: section,
      is_enabled: true,
      is_global: true,
      customer_name: "annoncement#{iterator}",
      customer_url: "customer_us_#{iterator}"
    )
  end
end
