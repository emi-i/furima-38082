FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'111aaa'}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth {Faker::Date.birthday}
  end
end
