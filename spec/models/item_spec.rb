require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいく時' do
      it '9項目入力により登録される' do
        expect(@item).to be_valid
      end
      it 'idが1ではないければ登録する事ができる' do
        @item.category_id = "2"
        @item.status_id = "2"
        @item.delivery_chager_id = "2"
        @item.delivery_area_id = "2"
        @item.delivery_days_id = "2"
        expect(@item).to be_valid
      end
      it 'textが1000文字以内であれば登録できる' do
        @item.text = ( "a" * 1000 )
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかない時' do
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'textが空では登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'textが1000文字を超える場合は登録できない' do
        @item.text = ( "a" * 1001 )
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
      end
      it '画像がなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品画像を入力してください')
      end
      it 'category_idがiでは登録できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'status_idが1では登録できない' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end
      it 'priceが300円未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが9,999,999円を超える場合は登録されない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は10000000より小さい値にしてください')
      end
      it 'priceが全角数字で入力されている場合は登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'delivery_chager_idが1でｈ登録されない' do
        @item.delivery_chager_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it 'delivery_area_idが1でｈ登録されない' do
        @item.delivery_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it 'delivery_days_idが1でｈ登録されない' do
        @item.delivery_days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it 'ユーザーが紐づいていないと商品登録をすることができない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
