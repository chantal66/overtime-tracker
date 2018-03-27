FactoryGirl.define do
  factory :post do
    date Date.today
    rationale 'Some lorem ipsum rationale'
  end

  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale 'Some content'
  end
end