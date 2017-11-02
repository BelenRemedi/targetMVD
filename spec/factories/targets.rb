# This will guess the User class
FactoryGirl.define do
  factory :target do
    title 'newtarget'
    area  100
    latitud '-34.906497699999996'
    longitud '-56.184926099999984'
    association :user
    association :topic
  end
end
