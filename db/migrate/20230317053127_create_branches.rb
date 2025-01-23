class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches, id: :uuid do |t|
      t.references :cluster, foreign_key: true,type: :uuid
      t.string :name
      t.string :short_name
      t.timestamps
    end
  end
end
