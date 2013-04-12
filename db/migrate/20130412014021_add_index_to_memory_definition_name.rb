class AddIndexToMemoryDefinitionName < ActiveRecord::Migration
  def change
    MemoryDefinition.transaction do
      add_index :memory_definitions, :name
    end
  end
end
