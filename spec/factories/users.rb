FactoryBot.define do #テストデータにあたる
  factory :user do
    nickname {'tester'} #nicknameは被ってもいいから、faker使わない。Faker::Name.last_name
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    familyname {'山田'}
    firstname {'太郎'}
    familykana {'ヤマダ'}
    firstkana {'タロウ'}
    birth {Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }


  end
end