FactoryBot.define do
  factory :user do
    email 'example@gmail.com'
    password 'example'
    dj_name 'Beldib'
    name 'Jiff'

    factory :admin do
      role 'admin'
    end
    factory :beginner do
      role 'beginner'
    end
  end
end
