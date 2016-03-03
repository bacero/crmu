class CreateAreaGroups < ActiveRecord::Migration
  def change
    create_table :area_groups do |t|
      t.string :name
      t.references :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
