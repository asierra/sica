json.extract! course, :id, :name, :course_day, :course_time, :academic_id, :created_at, :updated_at
json.url course_url(course, format: :json)
