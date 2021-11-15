FactoryBot.define do
  factory :recipe do
    name { 'MyString' }
    preparation_time { '11:00' }
    cooking_time { '11:00' }
    description { 'MyText' }
    public { true }
    user
  end
end
