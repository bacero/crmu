class CreateListProperties < ActiveRecord::Migration
  def change
    create_table :list_properties do |t|
      t.references :property, index: true, foreign_key: true
      t.references :type_client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
