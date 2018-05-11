class CreateStudentEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :student_entries do |t|
      t.references :student, foreign_key: true
      t.datetime :entry

      t.timestamps
    end
  end
end
