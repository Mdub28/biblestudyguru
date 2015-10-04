class Annotation < ActiveRecord::Base
  belongs_to :user
  belongs_to :annotation_type
  belongs_to :bible_book
  belongs_to :bible_translation
  def to_h
    {
      user: user.to_h,
      annotation_type: annotation_type.to_h,
      content: content,
      book: bible_book.to_h,
      chapter_start: chapter_start,
      verse_start: verse_start,
      character_start: character_start,
      chapter_end: chapter_end,
      verse_end: verse_end,
      character_end: character_end,
      bible_translation: bible_translation.to_h
    }
  end
end
