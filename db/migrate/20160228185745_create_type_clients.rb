class CreateTypeClients < ActiveRecord::Migration
  def change
    create_table :type_clients do |t|
      t.string :name
      t.text :description
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
