class CreateKindProperties < ActiveRecord::Migration
  def change
    create_table :kind_properties do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
