class MissingBiblePassageAnnotionFields < ActiveRecord::Migration
  def change
    add_column :bible_passage_annotations, :study_passage_id, :integer
  end
end
