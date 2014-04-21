FactoryGirl.define do
  factory :user do
    name "user_name"
    email "user_email"
    password "hunter2"
    password_confirmation "hunter2"
  end
end
