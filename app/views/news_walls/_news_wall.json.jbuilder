json.extract! news_wall, :id, :created_at, :updated_at
json.url news_wall_url(news_wall, format: :json)
