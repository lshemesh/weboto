# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :memory_definition do
    sequence(:name) {|i| "Memory definition #{i}" }
    memory_entry
  end
end
