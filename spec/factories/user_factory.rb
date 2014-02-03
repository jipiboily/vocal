FactoryGirl.define do
  factory :user, class: Opinionated::User do
    name "John Doe"
    email "john+doe@example.com"
    password "passwd123"
    password_confirmation "passwd123"
  end
end