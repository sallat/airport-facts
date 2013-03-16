FactoryGirl.define do
  factory :admin do |admin|
    admin.email 'admin@admin.com'
    admin.password 'password'
  end
end