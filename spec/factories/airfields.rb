# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :airfield do
    city "MyString"
    name "MyString"
    zone 1.5
    country "MyString"
    altitude 1
    iaco "MyString"
    longitude 1.5
    airport_id 1
    latitude 1.5
    iata_faa "MyString"
    dst "MyString"
  end
end
