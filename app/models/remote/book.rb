module Remote
  class Book < DigitalBiblePlatform::Base
    attr_accessor :description

    def initialize(description)
      self.description = description
    end

    def self.all
      client.books.collect do |book|
        self.new(book.book_name)
      end
    end
  end
end
