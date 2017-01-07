json.extract! film, :id, :nom, :realisateur, :created_at, :updated_at
json.url film_url(film, format: :json)