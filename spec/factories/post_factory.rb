FactoryGirl.define do
  factory :post, class: Opinionated::Post do
    title "Welcome"
    markdown "Welcome to...\n- meh"
    html "<p>Welcome to...</p>
      <ul>
      <li>meh</li>
      </ul>"

    trait :published do
      state :published
    end
  end
end