require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'ImageとNameとExplanationとCondition_idとShipping_change_idとShipping_area_idとCategory_idとDays_to_ship_idとPriceが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do

  
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end




    it 'nameが空では登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

 
       

    it 'explanationが空では登録できないこと' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
       

    it 'condition_idが1以下では登録できないこと' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
       

    it 'shipping_charge_idが1以下では登録できないこと' do
      @item.shipping_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
       

    it 'shipping_area_idが1以下では登録できないこと' do
      @item.shipping_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
       
    it 'category_idが1以下では登録できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'days_to_ship_idが1以下では登録できないこと' do
      @item.days_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300~¥9999999以外では登録できないこと' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
end
end
