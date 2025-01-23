class CreateClusters < ActiveRecord::Migration[7.0]
  def change
    create_table :clusters, id: :uuid do |t|
      t.references :area ,foreign_key: true, type: :uuid
      t.string :name
      t.string :short_name
      t.timestamps
    end
  end
end
