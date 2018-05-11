class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :course_day
      t.string :course_time
      t.references :academic, foreign_key: true

      t.timestamps
    end
  end
end
