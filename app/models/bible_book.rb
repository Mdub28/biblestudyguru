class BibleBook < ActiveRecord::Base
  def to_h
    {
      book_id: book_id,
      description: description
    }
  end
end
