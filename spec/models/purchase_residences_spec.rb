require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_residence = FactoryBot.build(:purchase_residence, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_residence).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_residence.building_name = ''
        expect(@purchase_residence).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @purchase_residence.token = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_residence.postal_code = ''
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_residence.postal_code = '1234567'
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include('Postal code is invalid')
      end

      it 'municipalityが空だと保存できないこと' do
        @purchase_residence.municipality = ''
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @purchase_residence.address = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_residence.phone_number = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_residence.phone_number = '２０００'
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが９桁未満では保存できないこと' do
        @purchase_residence.phone_number = 0o0000000

        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが１２桁を超過すると保存できないこと' do
        @purchase_residence.phone_number = 0o000000000000
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include('Phone number is invalid')
      end

      it 'shipping_area_idに「---」が選択されている場合は購入できないこと' do
        @purchase_residence.shipping_area_id = 1
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).not_to include("shipping_area can't be blank")
      end

      it 'userが紐付いていなければ購入できないこと' do
        @purchase_residence.user_id = 'nil'
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).not_to include("User can't be blank")
      end

      it 'itemが紐付いていなければ購入できないこと' do
        @purchase_residence.item_id = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
