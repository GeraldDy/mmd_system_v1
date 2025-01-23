class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :employee_number
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :sex
      t.string :civil_status
      t.date :birthday
      t.integer :age
      t.string :email_address
      
      t.timestamps
    end
  end
end
