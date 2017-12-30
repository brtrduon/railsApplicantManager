FactoryGirl.define do
  factory :employee do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    job_position "MyString"
    city "MyString"
    can_start "2017-12-30"
    user nil
  end
end
