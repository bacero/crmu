class CreateLaborChanges < ActiveRecord::Migration
  def change
    create_table :labor_changes do |t|
      t.text :property
      t.text :previus
      t.text :mint
      t.references :labor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
