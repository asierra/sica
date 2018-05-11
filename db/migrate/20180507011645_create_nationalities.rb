class CreateNationalities < ActiveRecord::Migration[5.1]
  def change
    create_table :nationalities, id: false do |t|
      t.primary_key :id
      t.string :name
      t.string :country
      t.string :iso2

      t.timestamps
    end
  end
end
