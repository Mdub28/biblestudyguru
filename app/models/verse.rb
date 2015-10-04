class Verse
  attr_accessor :start_chapter, :end_chapter, :start_verse, :end_verse
  def initialize(verse_string = nil, previous_verse = nil)
    if verse_string 
      puts verse_string.inspect
      if verse_string.index(':').present?
        if verse_string.split(':').length == 3 # '3:16-4:10'
          vstart, vend = verse_string.split('-')
          self.start_chapter, self.start_verse = vstart.split(':')
          self.end_chapter, self.end_verse = vend.split(':')
        else #  '3:16-21'
          vstart, vend = verse_string.split('-')
          self.start_chapter, self.start_verse = vstart.split(':')
          self.end_chapter, self.end_verse = self.start_chapter, vend
        end
      else # '16-21'
        self.start_chapter = previous_verse.end_chapter
        self.end_chapter = previous_verse.end_chapter
        self.start_verse, self.end_verse = verse_string.split('-')
      end
    end
  end

  def split_on_chapter
    if self.start_chapter < self.end_chapter
      (self.start_chapter.to_i..self.end_chapter.to_i).collect do |chapter|
        verse = self.class.new
        verse.start_chapter = chapter
        verse.end_chapter = chapter
        if chapter == self.start_chapter.to_i
          verse.start_verse = self.start_verse
        end
        if chapter == self.end_chapter.to_i
          verse.end_verse = self.end_verse
        end
        verse.start_verse ||= 1
        verse.end_verse ||= 200
        verse
      end
    else
      self
    end
  end
end
