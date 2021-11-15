FactoryBot.define do
  factory :recipe do
    name { 'MyString' }
    preparation_time { 'MyString' }
    cooking_time { 'MyString' }
    description { 'MyText' }
    public { false }
    user
  end
end
