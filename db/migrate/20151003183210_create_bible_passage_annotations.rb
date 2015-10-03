class CreateBiblePassageAnnotations < ActiveRecord::Migration
  def change
    create_table :bible_passage_annotations do |t|
      t.references :annotation, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
