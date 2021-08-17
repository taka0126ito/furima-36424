class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :user
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
  belongs_to :condition
  #has_one :purchase
  
  has_one_attached :image
  with_options presence: true do

    validates :name
    validates :explanation 
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/}
    validates :image

    with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :category_id
    validates :days_to_ship_id
 
    end

end

end