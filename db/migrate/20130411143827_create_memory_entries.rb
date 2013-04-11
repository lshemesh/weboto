class CreateMemoryEntries < ActiveRecord::Migration
  def change
    create_table :memory_entries do |t|
      t.string :name

      t.timestamps
    end
  end
end
