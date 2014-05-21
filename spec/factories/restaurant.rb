FactoryGirl.define do
  factory :restaurant do
    sequence(:name) { |n| "FoodShack#{n}" }
  end
end
