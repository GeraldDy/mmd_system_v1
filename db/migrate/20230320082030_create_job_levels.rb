class CreateJobLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :job_levels, id: :uuid do |t|
      t.string :name
      t.string :kso_id

      t.timestamps
    end
  end
end
