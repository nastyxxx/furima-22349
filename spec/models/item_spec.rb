require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全項目が存在するとき登録できること" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "textが空では登録できないこと" do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが全角数字だと登録できないこと" do
      @item.price = "３４５６"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが¥300~¥9,999,999以外だと登録できないこと" do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "categoryが選択されていないと登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "conditionが選択されていないと登録できないこと" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition Select")
    end

    it "delivery_chargeが選択されていないと登録できないこと" do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge Select")
    end

    it "prefectureが選択されていないと登録できないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it "handling_timeが選択されていないと登録できないこと" do
      @item.handling_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Handling time Select")
    end
  end
end
