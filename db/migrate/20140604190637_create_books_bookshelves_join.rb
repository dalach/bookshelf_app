class CreateBooksBookshelvesJoin < ActiveRecord::Migration
  def change
    create_table :books_bookshelves, :id => false do |t|
      t.column 'book_id', :integer
      t.column 'bookshelf_id', :integer
    end
  end
end
