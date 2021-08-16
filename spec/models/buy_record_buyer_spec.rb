require 'rails_helper'

RSpec.describe BuyRecordBuyer, type: :model do
  describe '配送先情報の保存機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_record_buyer = FactoryBot.build(:buy_record_buyer, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '配送先情報の保存ができる時' do
      it '全ての項目が入力されていれば保存できる' do
        expect(@buy_record_buyer).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @buy_record_buyer.building = ''
        expect(@buy_record_buyer).to be_valid
      end
      it 'postcodeが「3桁ハイフン4桁」なら保存できる' do
        @buy_record_buyer.postcode = '123-1234'
        expect(@buy_record_buyer).to be_valid
      end
      it 'phone_numberが「10桁以上11桁以内の半角数値」なら保存できる' do
        @buy_record_buyer.phone_number = '0123456789'
        expect(@buy_record_buyer).to be_valid
      end
    end
    context '配送先情報の保存ができない時' do
      it 'postcodeが空では保存できない' do
        @buy_record_buyer.postcode = ''
        @buy_record_buyer.valid?
        expect(@buy_record_buyer.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが「3桁ハイフン4桁」でないと保存できない' do
        @buy_record_buyer.postcode = '1234-123'
        @buy_record_buyer.valid?
        expect(@buy_record_buyer.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では保存できない' do
        @buy_record_buyer.prefecture_id = nil
        @buy_record_buyer.valid?
        expect(@buy_record_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @buy_record_buyer.city = ''
        @buy_record_buyer.valid?
        expect(@buy_record_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では保存できない' do
        @buy_record_buyer.block = ''
        @buy_record_buyer.valid?
        expect(@buy_record_buyer.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @buy_record_buyer.phone_number = ''
        @buy_record_buyer.valid?
        expect(@buy_record_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが「10桁以上11桁以内の半角数値」でないと保存できない' do
        @buy_record_buyer.phone_number = '090123456789'
        @buy_record_buyer.valid?
        expect(@buy_record_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では保存できない' do
        @buy_record_buyer.token = nil
        @buy_record_buyer.valid?
        expect(@buy_record_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end