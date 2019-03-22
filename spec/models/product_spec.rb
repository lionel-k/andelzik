# frozen_string_literal: true

require 'rails_helper'

describe Product, type: :model do
  let!(:product) do
    Product.create(name: 'Hammer',
                   category: 'Tools',
                   price: 10.99)
  end

  describe '.search' do
    subject { Product.search(term) }

    context 'has result' do
      context 'term in name' do
        let(:term) { 'hammer' }
        it { is_expected.to eq([product]) }
      end

      context 'term in category' do
        let(:term) { 'tool' }
        it { is_expected.to eq([product]) }
      end
    end

    context 'has no result' do
      let(:term) { 'nail' }
      it { is_expected.to eq([]) }
    end
  end

  # Validations
  context 'with valid data' do
    it 'should create a product' do
      product = Product.create!(name: 'Kisoro', category: 'game', price: 100)

      expect(product.persisted?).to be_truthy
      expect(product.name).to eq('Kisoro')
      expect(product.category).to eq('game')
      expect(product.price).to eq(100)
    end
  end

  context 'with invalid data' do
    it 'considers the object as invalid' do
      product = Product.create!(name: 'Kisoro', category: 'game', price: 100)

      expect(product.persisted?).to be_truthy
      expect(product.name).to eq('Kisoro')
      expect(product.category).to eq('game')
      expect(product.price).to eq(100)
    end

    it 'should not allow blank values' do
      product = Product.new(name: '', category: '', price: 12)
      expect(product).not_to be_valid
    end

    it 'should check if cost is positive' do
      product = Product.new(name: 'Kisoro',
                            category: 'game',
                            price: -3)

      expect(product).not_to be_valid
    end

    it 'should raise an error' do
      expect { Product.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
