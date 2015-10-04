class CreateStudyPassages < ActiveRecord::Migration
  def change
    create_table :study_passages do |t|
      t.references :study, index: true, foreign_key: true
      t.references :bible_book, index: true, foreign_key: true
      t.integer :chapter_start
      t.integer :verse_start
      t.integer :chapter_end
      t.integer :verse_end
      t.references :bible_translation, index: true, foreign_key: true
      t.integer :position
      t.references :bible_passage_annotation, index: true, foreign_key: true
      t.integer :duration_in_minutes

      t.timestamps null: false
    end
  end
end
