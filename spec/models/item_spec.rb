require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できる場合' do
      it 'カラムがすべて揃っている場合登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できない場合' do
      it 'imagesが空では場合登録できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を入力してください')
      end
      it 'status_idが空では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status を入力してください')
      end
      it 'defrayment_idが空では登録できない' do
        @item.defrayment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Defrayment を入力してください')
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を入力してください')
      end
      it 'ship_date_idが空では登録できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date を入力してください')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では登録できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが全角では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
