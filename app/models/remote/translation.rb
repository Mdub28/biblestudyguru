module Remote
  class Translation < DigitalBiblePlatform::Base
    attr_accessor :description, :abbreviation, :language

    def initialize(description, abbreviation, language)
      self.description = description
      self.abbreviation = abbreviation
      self.language = language
    end

    def self.all
      client.translations.collect do |translation|
        self.new(translation.version_name, translation.version_code, translation.language_english)
      end
    end
  end
end
