require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/test.png')
  end


  context '商品が出品できるとき' do
    it 'image、name、explain、category_id、condition_id、delivery_fee_id、prefecture_id、sending_days_id、selling_priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品が出品できないとき' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'explainが空では登録できない' do
      @item.explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーが未選択(--)では登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '商品の状態が未選択(--)では登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it 'delivery_fee_idが空では登録できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it '配送料の負担が未選択(--)では登録できない' do
      @item.delivery_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送元地域が未選択(--)では登録できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'sending_days_idが空では登録できない' do
      @item.sending_days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Sending days can't be blank")
    end
    it '発送までの日数が未選択(--)では登録できない' do
      @item.sending_days_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sending days must be other than 1")
    end
    it 'selling_priceが空では登録できない' do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end
    it 'selling_priceが300〜999999999の範囲外では登録できない' do
      @item.selling_price =  100
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not included in the list")
    end
    it '値段が半角英数混合では登録できない' do
      @item.selling_price =  'a1000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not included in the list")
    end
    it '値段が半角英語だけでは登録できない' do
      @item.selling_price =  'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not included in the list")
    end
    it '値段が全角文字では登録できない' do
      @item.selling_price =  '値段'
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not included in the list")
    end
    it '値段が10_000_000円以上では登録できない' do
      @item.selling_price =  1000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not included in the list")
    end
  end
end
