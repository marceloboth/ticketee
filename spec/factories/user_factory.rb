FactoryGirl.define do
  factory :user do
    name "user_name"
    email "sample@example.com"
    password "hunter2"
    password_confirmation "hunter2"
  end
end
