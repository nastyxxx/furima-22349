require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '#create' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    context 'ItemOrderが保存できる場合' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@item_order).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end
    end

    context 'ItemOrderが保存できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できないこと' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it 'cityが全角でないと保存できないこと' do
        @item_order.city = 'aaaaa'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('City is invalid. Input full-width characters.')
      end

      it 'house_numberが空では保存できないこと' do
        @item_order.house_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("House number can't be blank")
      end

      it 'house_numberが全角でないと保存できないこと' do
        @item_order.house_number = 'aaaaa'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('House number is invalid. Input full-width characters.')
      end

      it 'phone_numberが空では保存できないこと' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字でないと保存できないこと' do
        @item_order.phone_number = '０８０１２３４５６７８'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number Input only half-width number')
      end

      it 'tokenが空では登録できないこと' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
