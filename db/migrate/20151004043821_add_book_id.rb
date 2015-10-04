class AddBookId < ActiveRecord::Migration
  def change
    add_column :bible_books, :book_id, :string
  end
end
