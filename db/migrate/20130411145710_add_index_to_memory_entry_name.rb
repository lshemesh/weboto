class AddIndexToMemoryEntryName < ActiveRecord::Migration
  def change
    MemoryEntry.transaction do
      add_index :memory_entries, :name
    end
  end
end
