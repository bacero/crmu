class CreateLaborComments < ActiveRecord::Migration
  def change
    create_table :labor_comments do |t|
      t.text :description
      t.integer :kind
      t.references :labor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
