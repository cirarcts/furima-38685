require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
  end

  describe '購入情報登録' do
    context 'できる場合（正常系）' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@order_shipping).to be_valid
      end
      it 'building_nameは空の場合でも登録できる' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end

    context 'できない場合（異常系）' do
      it 'tokenが空の場合は登録できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空の場合は登録できない' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeにハイフンを含まない場合は登録できない' do
        @order_shipping.postal_code = '12345678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeは3桁ハイフン4桁の形式でない場合は登録できない' do
        @order_shipping.postal_code = '12-34567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeは全角を含む場合は登録できない' do
        @order_shipping.postal_code = '１２３-４５６７'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'prefecture_idがid: 1の場合は登録できない' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalitiesが空の場合は登録できない' do
        @order_shipping.municipalities = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'house_numberが空の場合は登録できない' do
        @order_shipping.house_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空の場合は登録できない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberの桁数が10桁より小さい場合は登録できない' do
        @order_shipping.phone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberの桁数が11桁より大きい場合は登録できない' do
        @order_shipping.phone_number = '123456789876'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberが全角を含む場合は登録できない' do
        @order_shipping.phone_number = '１２３４５６７８９１０'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'order_shippingはuserへ紐づいていない場合、登録できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "User can't be blank"
      end
      it 'order_shippingはitemへ紐づいていない場合、登録できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
