FactoryBot.define do
  factory :item do
    name {'本日販売開始'}              
    explanation{'本日販売開始'}          
    condition_id {'2'}                       
    shipping_charge_id{'2'}     
    shipping_area_id{'2'}        
    category_id {'2'}            
    days_to_ship_id{'2'}        
    price {'400'}  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user          
  end
end
