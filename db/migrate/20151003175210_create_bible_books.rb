class CreateBibleBooks < ActiveRecord::Migration
  def change
    create_table :bible_books do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
