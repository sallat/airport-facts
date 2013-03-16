# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do |review|
    review.airfield_id 1
    review.rating 1.5
    review.review "MyText"
    review.user_id 1
  end
end
