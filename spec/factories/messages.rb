FactoryGirl.define do

  factory :message do
    body                  {Faker::Lorem.sentence}
    chat_group_id         "1"
    user_id               "1"
    image                 {Faker::Pokemon.name}
  end
end
