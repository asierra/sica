class StudentScholarship < ApplicationRecord
  belongs_to :student
  belongs_to :scholarship
end
