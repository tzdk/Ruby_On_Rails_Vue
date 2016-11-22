class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.text :gender
      t.text :age
      t.text :telephone

      t.timestamps
    end
  end
end
