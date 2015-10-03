class Annotation < ActiveRecord::Base
  belongs_to :user
  belongs_to :annotation_type
  belongs_to :bible_book
  belongs_to :bible_translation
end
