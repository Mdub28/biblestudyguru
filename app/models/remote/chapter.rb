module Remote
  class Chapter < DigitalBiblePlatform::Base
    attr_accessor :chapter_title, :chapter_id, :verses
    def initialize(chapter_id, chapter_title)
      self.chapter_id = chapter_id
      self.chapter_title = chapter_title
      self.verses = []
    end

    def to_h
      {
        chapter_title: chapter_title,
        chapter_id: chapter_id,
        verses: verses.collect(&:to_h)
      }
    end
  end
end
