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
  admin_user = AdminUser.find_by(email: 'admin@example.com')

  if admin_user
    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && !admin_user
  end

  Section.delete_all
  NewsWall.delete_all

  if Section.count == 0 && NewsWall.count

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
    end
  end
end
