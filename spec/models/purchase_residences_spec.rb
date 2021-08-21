require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @purchase_residence = FactoryBot.build(:purchase_residence, user_id: user.id)
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

      it "tokenが空では登録できないこと" do
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
        expect(@purchase_residence.errors.full_messages).to include("Postal code is invalid")
      end
      #it 'prefectureを選択していないと保存できないこと' do
        #@purchase_residence.prefecture = 0
        #@purchase_residence.valid?
        #expect(@purchase_residence.errors.full_messages).to include("Prefecture can't be blank")
      #end
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
        expect(@purchase_residence.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_residence.phone_number = '２０００'
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが９桁未満では保存できないこと' do
        @purchase_residence.phone_number = 00000000
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが１２桁を超過すると保存できないこと' do
        @purchase_residence.phone_number = 0000000000000
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end


#配送先の住所情報も購入の都度入力させること。
#郵便番号が必須であること。
#郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
#都道府県が必須であること。
#市区町村が必須であること。
#番地が必須であること。
#建物名は任意であること。
#電話番号が必須であること。
#電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。

#クレジットカード情報は必須であり、右記のPAY.JPテストカードの情報で決済ができること（カード番号：4242424242424242　有効期限：今日より未来の日付　セキュリティコード：123）。
#クレジットカードの情報は購入の都度入力させること。