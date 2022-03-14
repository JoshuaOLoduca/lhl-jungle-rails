require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @product = Product.new
      @product.name = 'a name-a'
      @product.price_cents = 1;
      @product.quantity = 1;
      @product.category_id = Category.all.first.id;
    end

    context 'add product to db with no name' do
      it 'return error about name' do
        @product.name = nil
        @product.save

        expect(@product.errors.full_messages).to include('Name can\'t be blank')
      end
    end

    context 'add product to db with no price_cents' do
      it 'return error about price_cents' do
        @product.price_cents = nil
        @product.save

        expect(@product.errors.full_messages).to include('Price can\'t be blank')
      end
    end

    context 'add product to db with no quantity' do
      it 'return error about quantity' do
        @product.quantity = nil
        @product.save

        expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
      end
    end

    context 'add product to db with no category' do
      it 'return error about category' do
        @product.category = nil
        @product.save

        expect(@product.errors.full_messages).to include('Category can\'t be blank')
      end
    end

    context 'add product to db' do
      it 'return true on product.save' do
        expect(@product.save).to eq(true)
      end
    end

  end
end
