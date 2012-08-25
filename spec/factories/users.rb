FactoryGirl.define do
  
  factory :user do
    sequence(:login) { |n| "User#{n}" }
    password "secretpass"
    email { "#{login}@local.host".downcase }
  end

end
