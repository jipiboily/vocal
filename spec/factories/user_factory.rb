FactoryGirl.define do
  factory :user, class: Opinionated::User do
    sequence(:name){|n| "John Doe ##{n}"}
    sequence(:email){ |n| "john+doe+#{n}@example.com"}
    password "passwd123"
    password_confirmation "passwd123"
  end
end