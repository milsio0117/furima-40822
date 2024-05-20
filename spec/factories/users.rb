FactoryBot.define do
    factory :user do
        japanese_user = Gimei.name

        nick_name { Faker::Name.name }
        email { Faker::Internet.email }
        password { Faker::Internet.password }
        password_confirmation { password }

        last_name { [japanese_user.last.kanji, japanese_user.last.hiragana].sample }
        first_name { [japanese_user.first.kanji, japanese_user.first.hiragana].sample }
        
        last_name_kana { japanese_user.last.katakana }
        first_name_kana { japanese_user.first.katakana }
        birthday { Faker::Date.birthday }
    end
end