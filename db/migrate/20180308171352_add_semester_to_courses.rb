class AddSemesterToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :semester, :string
  end
end
