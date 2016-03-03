class AddClientIdToLabor < ActiveRecord::Migration
  def change
    add_reference :labors, :client, index: true, foreign_key: true
  end
end
