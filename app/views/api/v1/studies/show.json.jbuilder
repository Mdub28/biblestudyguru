json.name = @study.name
json.description = @study.description
json.course do |course|
  course.id = @study.course.id
  course.name = @study.course.name
end
json.study_passages @study.study_passages do |study_passage|
  json.bible_book do |bible_book|
    bible_book.name = study_passage.bible_book.name
    bible_book.id = study_passage.bible_book.id
  end
  json.chapter_start = study_passage.chapter_start
  json.verse_start = study_passage.verse_start
  json.chapter_end = study_passage.chapter_end
  json.verse_end = study_passage.verse_end
  json.bible_translation = study_passage.bible_translation
  json.position = study_passage.position
  json.annotations study_passage.annotations do |annotation|
    annotation.user = study_passage.annotation.user
    annotation.annotation_type = study_passage.annotation.user
    annotation.content = study_passage.annotation.content
    annotation.book = study_passage.annotation.book
    annotation.chapter_start = study_passage.annotation.chapter_start
    annotation.verse_start = study_passage.annotation.verse_start
    annotation.character_start = study_passage.annotation.character_start
    annotation.chapter_end = study_passage.annotation.chapter_end
    annotation.verse_end = study_passage.annotation.verse_end
    annotation.character_end = study_passage.annotation.character_end
    annotation.bible_translation = study_passage.annotation.bible_translation
  end
  json.duration_in_minutes = study_passage.duration_in_minutes
end
