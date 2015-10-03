json.array!(@studies) do |study|
  json.extract! study, :id, :course_id, :position
  json.url study_url(study, format: :json)
end
