class Item < ApplicationRecord
  with_options presence: true do

    validates :nickname
    validates :explanation
    validates :condition_id
    validates :user
    validates :Shipping_charge_id 
    validates :Shipping_area_id 
    validates :category_id 
    validates :Days_to_ship_id 
    validates :price

    belongs_to :user
 #has_one :purchase

 has_one_attached :image
end
