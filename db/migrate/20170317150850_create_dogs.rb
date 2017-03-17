class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :race
      t.integer :gender
      t.boolean :castrated
      t.date :birthday
      t.string :name
      t.string :name_owner
      t.string :phone

      t.timestamps
    end
  end
end
