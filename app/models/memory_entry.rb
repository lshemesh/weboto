class MemoryEntry < ActiveRecord::Base
  has_many :memory_definitions

  validates :name, presence: true, uniqueness: true
end
