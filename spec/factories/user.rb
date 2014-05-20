FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end
