class CreateStudentAcademics < ActiveRecord::Migration[5.1]
  def change
    create_table :student_academics do |t|
      t.references :student, foreign_key: true
      t.references :academic, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
