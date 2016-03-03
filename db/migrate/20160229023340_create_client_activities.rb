class CreateClientActivities < ActiveRecord::Migration
  def change
    create_table :client_activities do |t|
      t.text :description
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
