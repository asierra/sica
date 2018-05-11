class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname_paternal
      t.string :surname_maternal
      t.string :account
      t.string :email
      t.string :institution
      t.binary :photo, :limit => 1.megabyte
      t.string :contact_name
      t.string :contact_tel
      t.integer :status

      t.timestamps
    end
  end
end
