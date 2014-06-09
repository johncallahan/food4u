FactoryGirl.define do
  factory :restaurant do
    sequence(:name) { |n| "FoodShack#{n}" }
    trait :tag1 do
      after(:create) { |r| r.update_attributes(tag_list: 'tag1') }
    end
    trait :tag2 do
      after(:create) { |r| r.update_attributes(tag_list: 'tag2') }
    end
    trait :tag3 do
      after(:create) { |r| r.update_attributes(tag_list: 'tag3') }
    end
  end
end
