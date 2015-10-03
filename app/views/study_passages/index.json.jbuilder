json.array!(@study_passages) do |study_passage|
  json.extract! study_passage, :id, :study_id, :bible_book, :chapter_start, :verse_start, :chapter_end, :verse_end, :bible_translation_id, :position, :bible_passage_annotation_id, :duration_in_minutes
  json.url study_passage_url(study_passage, format: :json)
end
