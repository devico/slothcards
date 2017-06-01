FactoryGirl.define do

  factory :user do
    email "test@example.com"
    password "123654"
    password_confirmation { password }
  end
end
