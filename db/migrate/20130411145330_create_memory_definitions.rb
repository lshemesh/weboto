class CreateMemoryDefinitions < ActiveRecord::Migration
  def change
    create_table :memory_definitions do |t|
      t.text :name
      t.integer :memory_entry_id

      t.timestamps
    end
  end
end
