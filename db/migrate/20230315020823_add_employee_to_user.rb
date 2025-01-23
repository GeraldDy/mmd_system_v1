class AddEmployeeToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :employee, foreign_key: true, type: :uuid
  end
end
