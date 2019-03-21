# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  context '#create' do
    it 'creates a purchase with valid data' do
      user = User.create(name: 'Paul')
      album = Album.create!(title: 'people', performer: 'man', cost: 20)
      put :create, params: {
                          purchase: {
                                  user_id: user.id,
                                  album_id: album.id
                                }
                          }

      json = JSON.parse(response.body)
      expect(json['user_id']).to eq(user.id)
      expect(json['album_id']).to eq(album.id)
      expect(response).to have_http_status(200)
    end
  end
end
