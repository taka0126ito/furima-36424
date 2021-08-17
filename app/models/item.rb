class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  with_options presence: true do

    validates :name
    validates :explanation
    validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}  
    validates :user
    validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}   
    validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}  
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}  
    validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}  
    validates :price

end

belongs_to :user
belongs_to :category
belongs_to :shipping_charge
belongs_to :shipping_area
belongs_to :days_to_ship
belongs_to :condition
#has_one :purchase

has_one_attached :image

end
