class StudyPassage < ActiveRecord::Base
  belongs_to :study
  belongs_to :bible_translation
  belongs_to :bible_passage_annotation
  belongs_to :bible_book

  has_many :annotations, -> { order 'bible_passage_annotations.position' }, through: :bible_passage_annotation

  def description
    self.bible_book.description + " #{chapter_start}:#{verse_start}-#{chapter_end}:#{verse_end}"
  end

  def to_h
    {
      chapter_start: chapter_start,
      verse_start: verse_start,
      chapter_end: chapter_end,
      verse_end: verse_end,
      bible_translation: bible_translation,
      position: position,
      annotations: annotations.collect(&:to_h),
      duration_in_minutes: duration_in_minutes,
      bible_passage: bible_passage.to_h
    }
  end

  def bible_passage
    VerseParser.from_defined(bible_book, chapter_start, verse_start, chapter_end, verse_end).fetch_bible_data
  end

end
