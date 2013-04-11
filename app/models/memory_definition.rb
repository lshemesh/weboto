
class MemoryDefinition < ActiveRecord::Base
  belongs_to :memory_entry

  validates :memory_entry, presence: true
  validates :name, presence: true, :uniqueness => { scope: :memory_entry_id }
end
