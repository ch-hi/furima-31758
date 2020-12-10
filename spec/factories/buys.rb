FactoryBot.define do
  factory :buy do
    posta { '123-4567' }
    area { 1 }
    city { '横浜市緑区' }
    banchi { '123-4567' }    
    phonenumber { '12345678901' }
    # - クレジットカード決済ができること
    
    # - クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと
    
    # - 購入が完了したら、トップページまたは購入完了ページに遷移すること   

    price {3000}
  end
end
