FactoryBot.define do
  factory :purchase_residence do
    building_name {'本日販売開始'}              
    postal_code {'111-1111'}          
    #prefecture {'北海道'}                       
    municipality {'横浜市'}     
    shipping_area_id {2}        
    address {2}            
    phone_number {19012345678}   
    token {'00000000000000'}  
    item_id {3}           
  end
end