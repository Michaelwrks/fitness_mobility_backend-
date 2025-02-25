FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "john@example.com" }
    age { 25 }
    password { "password123" }  
  end
end
