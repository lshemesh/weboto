# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :memory_entry do
    sequence(:name) {|i| "Memory Entry #{i}" }
  end
end
