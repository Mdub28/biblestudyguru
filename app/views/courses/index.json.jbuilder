json.array!(@courses) do |course|
  json.extract! course, :id, :user_id, :name, :description
  json.url course_url(course, format: :json)
end
