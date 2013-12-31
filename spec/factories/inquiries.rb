# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inquiry do
    email "MyString@email.com"
    subject "MyString"
    description "MyTexsadasdsadasdasdsadt"
    first_name "Kevin"
    last_name "Kwon"
  end
end
