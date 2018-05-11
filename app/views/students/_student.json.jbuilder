json.extract! student, :id, :name, :surname_paternal, :surname_maternal, :account, :email, :institution, :photo, :contact_name, :contact_tel, :status, :created_at, :updated_at
json.url student_url(student, format: :json)
