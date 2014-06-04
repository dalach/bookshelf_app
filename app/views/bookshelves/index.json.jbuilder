json.array!(@bookshelves) do |bookshelf|
  json.extract! bookshelf, :id, :name, :user_id
  json.url bookshelf_url(bookshelf, format: :json)
end
