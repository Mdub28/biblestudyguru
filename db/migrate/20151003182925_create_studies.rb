class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.references :course, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
