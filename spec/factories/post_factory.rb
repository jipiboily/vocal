FactoryGirl.define do
  factory :post, class: Opinionated::Post do
    title "Welcome"
    markdown "Welcome to...\n- meh"
    html "<p>Welcome to...</p>
      <ul>
      <li>meh</li>
      </ul>"
    published_at '2014-12-30'

    after(:build) do |post|
      post.user_id ||= create(:user).id
    end

    Opinionated::Post.states.keys.each do |state_name|
      trait state_name.to_sym do # :published, :draft, :deleted...
        state state_name
      end
    end
  end
end