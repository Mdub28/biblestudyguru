class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :annotation_type, index: true, foreign_key: true
      t.text :content
      t.boolean :private, default => false
      t.references :bible_book, index: true, foreign_key: true
      t.integer :chapter_start
      t.integer :verse_start
      t.integer :character_start
      t.integer :chapter_end
      t.integer :verse_end
      t.integer :character_end
      t.references :bible_translation, index: true, foreign_key: true
      t.boolean :deleted

      t.timestamps null: false
    end
  end
end
