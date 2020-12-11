FactoryBot.define do
  factory :buy_form do
    posta { '123-4567' }
    city { '横浜市緑区' }
    banchi { '123-4567' }    
    phonenumber { '12345678901' }
    token {"tok_abcdefghijk00000000000000000"}  
    area {2}     
  end
end
