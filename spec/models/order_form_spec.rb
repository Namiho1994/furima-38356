require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it '建物名がからでも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと配送先情報の保存ができない' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字でないと配送先情報の保存ができない' do
        @order_form.postal_code = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと配送先情報の保存ができない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと配送先情報の保存ができない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと配送先情報の保存ができない' do
        @order_form.addresses = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空だと配送先情報の保存ができない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁未満だと保存できない' do
        @order_form.phone_number = 910_123_111
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと保存できない' do
        @order_form.phone_number = 123_123_123_123
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
