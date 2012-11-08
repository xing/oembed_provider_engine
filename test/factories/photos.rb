FactoryGirl.define do
  factory :photo do
    sequence(:title) { |n| "a title#{n}"}
    sequence(:url) { |n| "http://example.com/photo?id=#{n}"}
    sequence(:width) { |n| "600"}
    sequence(:height) { |n| "400"}
  end

  factory :item do
    sequence(:label) { |n| "a label#{n}"}
    sequence(:description) { |n| "a description#{n}"}
  end
end

