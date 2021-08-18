require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品登録ができる時' do
    it 'ImageとNameとExplanationとCondition_idとShipping_change_idとShipping_area_idとCategory_idとDays_to_ship_idとPriceが存在すれば登録できること' do
      expect(@item).to be_valid
    end
   end

   context '商品登録ができない時' do
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

    it 'ユーザー情報が空では登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

 
       

    it 'explanationが空では登録できないこと' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
       

    it 'condition_idが1以下では登録できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
       

    it 'shipping_charge_idが1以下では登録できないこと' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
       

    it 'shipping_area_idが1以下では登録できないこと' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
       
    it 'category_idが1以下では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'days_to_ship_idが1以下では登録できないこと' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300未満では登録できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが¥1000000以上では登録できないこと' do
      @item.price = 20000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが半角英数混合では登録できないこと' do
      @item.price = 'hu2121'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが半角英語では登録できないこと' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price only number", "Price is not included in the list")
    end

    it 'priceが全角数字では登録できないこと' do
      @item.price = '７７７７７'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end



  end
end
end


