# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if AnnotationType.count == 0
  AnnotationType::TYPES.each do | type |
    AnnotationType.create(description: type)
  end
end

if Denomination.count == 0
  Denomination::TYPES.each do | type |
    Denomination.create(description: type)
  end
end

if BibleTranslation.count == 0 
  Remote::Translation.all.each do |translation|
    BibleTranslation.create(
      description: translation.description,
      abbreviation: translation.abbreviation,
      language: translation.language
    )
  end
end

if BibleBook.count == 0 
  Remote::Book.all.each do |book|
    BibleBook.create(description: book.description, book_id: book.book_id)
  end
end
