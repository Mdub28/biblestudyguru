require 'fuzzy_match'
class VerseParser
  attr_accessor :book, :verse_ranges

  def initialize(verse_string=nil)
    self.book, self.verse_ranges = parse_book_verse(verse_string) if verse_string.present?
  end

  def parse_book_verse(verse_string)
    verse_strings = verse_string.scan(/[1-9-:]*/).select(&:'present?')
    book_string = verse_string.scan(/[0-9]{0,1}?[\ ]{0,1}?[a-zA-Z]+/).select(&:'present?').first
    [best_book(book_string.downcase), build_verses(verse_strings)]
  end

  def best_book(book_string)
    BibleBook.find_by_description(FuzzyMatch.new(BibleBook.pluck(:description).reverse).find(book_string))
  end

  def build_verses(verse_strings)
    previous_verse = nil
    verse_strings.collect do |verse_string|
      previous_verse = Verse.new(verse_string, previous_verse)
    end
  end

  def fetch_bible_data
    self.split_verse_ranges_on_chapter.collect do |verse|
      Remote::Verse.load(self.book.book_id, verse.start_chapter, verse.start_verse, verse.end_verse)
    end.inject do |ret, book|
      if book.nil?
        ret
      else
        ret.merge(book)
      end
    end
  end

  def self.from_defined(book, start_chapter, start_verse, end_chapter, end_verse)
    parser = new
    parser.book = book
    verse = Verse.new
    verse.start_chapter = start_chapter
    verse.end_chapter = end_chapter
    verse.start_verse = start_verse
    verse.end_verse = end_verse
    parser.verse_ranges = [verse]
    parser
  end

  def split_verse_ranges_on_chapter
    self.verse_ranges.collect do |verse_range|
      verse_range.split_on_chapter
    end.flatten
  end

  def books
    BibleBook.all
  end
end
