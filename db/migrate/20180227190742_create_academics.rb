class CreateAcademics < ActiveRecord::Migration[5.1]
  def change
    create_table :academics do |t|
      t.string :name
      t.string :account

      t.timestamps
    end
  end
end
