FactoryBot.define do
  factory :post do
    name "sample post"

    trait :invalid do
      name "a"*256
    end
  end

  factory :post_1, class: Post do
    name "This is first post."
  end

  factory :post_2, class: Post do
    name "2nd Post"
  end
end
