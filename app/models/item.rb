class Item < ApplicationRecord
  with_options presence: true do

    validates :nickname
    validates :explanation
    validates :condition_id
    validates :user
    validates :Shipping_charge_id 
    validates :Shipping_area_id 
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}  
    validates :Days_to_ship_id 
    validates :price
    validates :title
    validates :text

end

belongs_to :user
belongs_to :category
belongs_to :Shipping_charge
belongs_to :Shipping_area
belongs_to :Days_to_ship
belongs_to :condition
#has_one :purchase

has_one_attached :image
end
