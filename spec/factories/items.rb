FactoryBot.define do
  factory :item do
    name {'tester'}       
    describe {'testertester'}    
    category_id {'2'} 
    condition_id {'2'} 
    fee_id {'2'}      
    area_id {'2'}     
    day_id {'2'}      
    payment {'aaa'}     
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test1.png'), filename: 'test1.png')
    end
  end
end
