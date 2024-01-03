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

  CONTENT_NEW = <<~TEXT
    En lo que va de este segundo día del año nuevo, se reportó un incendio en un taller mecánico en el municipio de Apizaco, mismo que dejó cuantiosos daños materiales.

    De acuerdo con información preliminar, el incendio se registró en un taller de hojalatería y pintura, localizado en la colonia Covadonga, en Apizaco.
    
    Al arribar los bomberos, protección civil municipal e incluso ambulancias de la Cruz Roja, sólo se registraron daños materiales en 4 autobuses y un microbús, que quedaron totalmente calcinados.
    
    Por la noche del lunes, se reportó el incendio en el relleno sanitario de Panotla, mismo que comenzó el lunes por la noche y se mantenía personal de bomberos tratando de sofocar el incendio.
  TEXT

  folder_path = Rails.root.join("db", "seeds","images")

  file_news_names = Dir.entries(folder_path).select do |entry|
    File.file?(File.join(folder_path, entry)) && entry.start_with?("n")
  end

  file_article_names = Dir.entries(folder_path).select do |entry|
    File.file?(File.join(folder_path, entry)) && entry.start_with?("ar")
  end

  50.times do |iterator|
    NewsWall.create!(
      title: "Incendios desatados en Tlaxcala deja daños materiales en relleno sanitario y taller mecánico",
      subtitle: "mysubtitle",
      author: "david sarmiento",
      content: CONTENT_NEW,
      section: section,
      image: File.open(Rails.root.join("db", "seeds","images", file_news_names.sample))
    )

    Article.create!(
      image: File.open(Rails.root.join("db", "seeds","images", file_article_names.sample)),
      title: 'daños materiales en relleno sanitario',
      author: 'un indio',
      content: CONTENT_NEW,
      social_media_contact: "na",
      foot_note: 'info por un chismoso'
    )
  end

  Announcement.create!(
    section: section,
    is_enabled: true,
    is_global: true,
    customer_name: "cocacola",
    customer_url: "https://cocacola.com",
    image: File.open(Rails.root.join("db", "seeds","images", "an1.png"))
  )

  Announcement.create!(
    section: section,
    is_enabled: true,
    is_global: true,
    customer_name: "foxsports",
    customer_url: "https://foxsports.com",
    image: File.open(Rails.root.join("db", "seeds","images", "an2.png"))
  )

  Announcement.create!(
    section: section,
    is_enabled: true,
    is_global: true,
    customer_name: "kodak",
    customer_url: "https://kodak.com",
    image: File.open(Rails.root.join("db", "seeds","images", "an3.jpg"))
  )
end
