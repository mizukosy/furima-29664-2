require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品購入に関する情報の保存' do
    context '商品購入ができる場合' do
      it '全ての値が保存された時保存できる' do
        expect(@item_order).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'post_codeが空では登録できない' do
        @item_order.post_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'post_codeにハイフン（-）がなければ登録できない' do
        @item_order.post_code = '1111111'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'post_codeにハイフン（-）が全角である場合、登録できない' do
        @item_order.post_code = '111ー1111'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'post_codeが全角数字で入力されている場合、登録できない' do
        @item_order.post_code = '１１１-１１１１'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '郵便番号が正しく入力されていない場合は登録できない' do
        @item_order.post_code = '11-11'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'prefecture_idが1では登録できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空では登録できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('市町村を入力してください')
      end
      it 'blockが空では登録できない' do
        @item_order.block = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('番地を入力してください')
      end
      it 'buildingは空でも登録できる' do
        @item_order.building = nil
        @item_order.valid?
        expect(@item_order).to be_valid
      end
      it 'telephoneが空では登録できない' do
        @item_order.telephone = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'telephoneはハイフンがある場合は登録できない' do
        @item_order.telephone = '1111-11111'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が11桁を超える場合は登録できない' do
        @item_order.telephone = '111111111111'
        @item_order.valid?

        expect(@item_order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が全角数字の場合、登録できない' do
        @item_order.telephone = '１１１１１１１１１１１'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空では登録できない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
    end
  end
end
