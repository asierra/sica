class AddScholarshipToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :scholarship, foreign_key: true
  end
end
