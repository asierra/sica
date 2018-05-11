class AddPlaceOfBirthToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :place_of_birth, :string
  end
end
