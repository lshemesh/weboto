class AddIndexToMemoryEntryIdOnMemoryDefinition < ActiveRecord::Migration
  def change
    MemoryDefinition.transaction do
      add_index :memory_definitions, :memory_entry_id
    end
  end
end
