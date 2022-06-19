require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.5
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end
    
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力できていたら購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid 
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @purchase_address.post_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが全角だと購入できない' do
        @purchase_address.post_code = '１１１１１１１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureが空だと購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'telが空だと購入できない' do
        @purchase_address.tel = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが10桁より少ないと購入できない' do
        @purchase_address.tel = '1111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが11桁より多いと購入できない' do
        @purchase_address.tel = '111111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが全角だと購入できない' do
        @purchase_address.tel = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'telにハイフンがあると購入できない' do
        @purchase_address.tel = '111-1111-1111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'userが紐づいていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
