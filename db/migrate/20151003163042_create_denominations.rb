class CreateDenominations < ActiveRecord::Migration
  def change
    create_table :denominations do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
