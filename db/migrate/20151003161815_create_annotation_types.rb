class CreateAnnotationTypes < ActiveRecord::Migration
  def change
    create_table :annotation_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
