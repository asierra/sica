class CreateStudentScholarships < ActiveRecord::Migration[5.1]
  def change
    create_table :student_scholarships do |t|
      t.references :student, foreign_key: true
      t.references :scholarship, foreign_key: true

      t.timestamps
    end
  end
end
