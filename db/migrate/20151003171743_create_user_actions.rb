class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.string :description
      t.string :link_text
      t.string :link
      t.references :user, index: true, foreign_key: true
      t.integer :weight

      t.timestamps null: false
    end
  end
end
