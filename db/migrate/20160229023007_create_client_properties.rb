class CreateClientProperties < ActiveRecord::Migration
  def change
    create_table :client_properties do |t|
      t.string :value
      t.references :property, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
