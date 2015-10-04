class VerseParser
  def initialize(verse_string)
    self.book, self.verse_ranges = parse_book_verse(verse_string)
  end

  def parse_book_verse(verse_string)
    verse_strings = verse_string.scan(/[1-9-:]*/).select(&:'present?')
    book_string = verse_string.scan(/[0-9]{0,1}?[\ ]{0,1}?[a-zA-Z]+/).select(&:'present?')
    [matching_book(book_string.downcase), matching_verses(verse_strings)]
  end

  def matching_book(book_string)
  end

  def score_books(book_string)
  end

  def books
    BibleBook.pluck('description')
  end
end
