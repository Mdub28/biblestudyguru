module Remote
  class Verse < DigitalBiblePlatform::Base
    attr_accessor :verse_number, :content
    def self.load(book_id, chapter, start_verse, end_verse)
      book = nil
      client.verses(book_id, chapter, start_verse, end_verse).each do |verse|
        book ||= Book.new(verse.book_name, verse.book_id)
        book.chapters[verse.chapter_id] ||= Chapter.new(verse.chapter_id, verse.chapter_title)
        book.chapters[verse.chapter_id].verses << Verse.new(verse.verse_text, verse.verse_id)
      end
      book
    end

    def initialize(content, verse_number)
      self.content = content
      self.verse_number = verse_number
    end

    def to_h
      {
        verse_number: verse_number,
        content: content
      }
    end
  end
end
