# frozen_string_literal: true

require 'rails_helper'

describe Product, type: :model do
  let!(:product) do
    create(:product, name: 'Hammer',
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

  describe 'validations' do
    it { validate_presence_of(:name) }
    it { validate_presence_of(:category) }
    it { validate_presence_of(:price) }
    it 'should check if cost is positive' do
      product = build(:product, price: -3)
      expect(product).not_to be_valid
    end
  end
end
