json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :cover_photo
  json.url book_url(book, format: :json)
end
