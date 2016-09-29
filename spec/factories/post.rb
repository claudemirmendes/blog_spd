FactoryGirl.define do
  factory :post, class: 'Post' do
    title { Faker::Name.title }
    body  { Faker::Lorem.paragraph }
  end
end