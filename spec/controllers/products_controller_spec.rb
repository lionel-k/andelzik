# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #search' do
    it 'returns http success' do
      get :search

      expect(response).to have_http_status(200)
    end
  end

  describe '#search' do
    let!(:product) do
      Product.create(name: 'Blue shoes', category: 'Footwear', price: 10.99)
    end

    it 'returns json' do
      5.times do |i|
        Product.create!(name: "name#{i}", category: "category#{i}", price: 12)
      end

      get 'search', params: { term: 'Shoe', format: :json }

      first_product = JSON.parse(response.body).first
      expect(first_product['name']).to eq 'Blue shoes'
      expect(first_product['category']).to eq 'Footwear'
      expect(first_product['price']).to eq '10.99'
    end
  end
end
