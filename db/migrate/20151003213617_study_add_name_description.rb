class StudyAddNameDescription < ActiveRecord::Migration
  def change
    add_column :studies, :name, :string
    add_column :studies, :description, :string
  end
end
