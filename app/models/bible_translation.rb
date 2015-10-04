class BibleTranslation < ActiveRecord::Base

  def to_h
    {
      description: description,
      abbreviation: abbreviation,
      language: language
    }
  end
end
