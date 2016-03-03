class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.string :name
      t.text :description
      t.integer :indicator
      t.text :indicator_description
      t.date :ending
      t.date :initiation
      t.references :area_aim, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
