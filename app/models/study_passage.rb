class StudyPassage < ActiveRecord::Base
  belongs_to :study
  belongs_to :bible_translation
  belongs_to :bible_passage_annotation
  has_many :annotations, -> { order 'bible_passage_annotations.position' }, through: :bible_passage_annotation
end
