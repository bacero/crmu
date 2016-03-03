class CreateAreaAims < ActiveRecord::Migration
  def change
    create_table :area_aims do |t|
      t.string :name
      t.text :description
      t.references :area, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
