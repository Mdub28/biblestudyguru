module Remote
  class Book < DigitalBiblePlatform::Base
    attr_accessor :description, :book_id, :chapters

    def initialize(description, book_id)
      self.description = description
      self.book_id = book_id
      self.chapters = {}
    end

    def self.all
      client.books.collect do |book|
        self.new(book.book_name, book.book_id)
      end
    end

    def merge(duplicate_book)
      duplicate_book.chapters.keys.each do |chapter_key|
        if self.chapters[chapter_key]
          self.chapters[chapter_key].verses += duplicate_book.chapters[chapter_key].verses
        else
          self.chapters[chapter_key] = duplicate_book.chapters[chapter_key]
        end
      end
      self
    end

    def to_h
      {
        description: description,
        book_id: book_id,
        chapters: chapters.values.collect(&:to_h)
      }
    end
  end
end
