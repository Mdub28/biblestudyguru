class CreateBibleTranslations < ActiveRecord::Migration
  def change
    create_table :bible_translations do |t|
      t.string :description
      t.string :abbreviation
      t.string :language

      t.timestamps null: false
    end
  end
end
