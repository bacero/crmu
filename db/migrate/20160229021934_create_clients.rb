class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :identity
      t.string :telephone
      t.string :address
      t.references :state, index: true, foreign_key: true
      t.references :type_client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
