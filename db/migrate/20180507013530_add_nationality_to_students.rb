class AddNationalityToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :nationality, foreign_key: true
  end
end
