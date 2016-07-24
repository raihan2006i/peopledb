class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :blood_group
      t.string :email
      t.string :profession
      t.text :address
      t.string :phone
      t.boolean :approved, default: false

      t.timestamps null: false
    end
  end
end
