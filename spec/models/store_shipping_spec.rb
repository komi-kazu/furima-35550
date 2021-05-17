require 'rails_helper'

RSpec.describe StoreShipping, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('app/assets/images/test.png')
      item.save
      @store_shipping = FactoryBot.build(:store_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@store_shipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @store_shipping.building_name = ''
        expect(@store_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postalが空だと保存できないこと' do
        @store_shipping.postal = ''
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Postal can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @store_shipping.municipality = ''
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @store_shipping.address = ''
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @store_shipping.phone_number = ''
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @store_shipping.postal = '1234567'
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @store_shipping.prefecture_id = nil
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @store_shipping.prefecture_id = 1
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'phone_numberが半角数字ではないと保存できないこと' do
        @store_shipping.phone_number = '０８０１２３４５６７８'
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_numberが11文字以下ではないと保存できないこと' do
        @store_shipping.phone_number = '1234567891011'
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'userが紐付いていないと保存できないこと' do
        @store_shipping.user_id = nil
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @store_shipping.item_id = nil
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @store_shipping.token = nil
        @store_shipping.valid?
        expect(@store_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
