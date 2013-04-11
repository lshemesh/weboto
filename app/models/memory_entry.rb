class MemoryEntry < ActiveRecord::Base
  has_many :memory_definitions, :dependent => :destroy

  validates :name, presence: true, uniqueness: true
end
