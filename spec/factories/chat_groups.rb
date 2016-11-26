FactoryGirl.define do
  factory :chat_group do
    name                   {Faker::Name.name}
    after(:create) do |chat_group|
      chat_group.users << create(:user)
    end
  end
end
