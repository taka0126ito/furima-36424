class PurchaseResidence
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :municipality, :address, :building_name, :phone_number, :shipping_charge_id, :shipping_area_id,
                :token

  with_options presence: true do
    validates :user_id
    validates :token
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipality
    validates :address
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_charge_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Residence.create(postal_code: postal_code, municipality: municipality, address: address, building_name: building_name,
                     phone_number: phone_number, shipping_area_id: shipping_area_id, shipping_charge_id: shipping_charge_id, purchase_id: purchase.id)
  end
end
