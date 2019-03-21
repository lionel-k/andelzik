# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  context '#create' do
    it 'creates an album with valid data' do
      post :create, params: {
                          album: {
                                  title: 'The album',
                                  performer: 'The guy',
                                  cost: 20
                                }
                          }

      json = JSON.parse(response.body)
      expect(json['title']).to eq('The album')
      expect(json['performer']).to eq('The guy')
      expect(json['cost']).to eq(20)
      expect(response).to have_http_status(200)
    end
  end

  context '#index' do
    it 'renders all albums' do
      5.times do
        build_album
      end

      get :index

      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end

  context '#update' do
    it 'updates data of a given album' do
      album = build_album

      put 'update', params: { id: album.id, album: { title: 'New Title' } }

      json = JSON.parse(response.body)
      expect(json['title']).to eq('New Title')
      expect(json['performer']).to eq(album.performer)
      expect(json['cost']).to eq(album.cost)
      expect(response).to have_http_status(200)
    end
  end

  context '#destroy' do
    it 'deletes an album' do
      album = build_album
      album_id = album.id

      delete 'destroy', params: { id: album_id }

      expect(response.body).to be_empty
      expect(response).to have_http_status(204)
      expect(Album.ids).not_to include album_id
    end
  end

  context '#show' do
    it 'displays an album' do
      album = build_album

      get 'show', params: { id: album.id }

      json = JSON.parse(response.body)
      expect(json['title']).to eq('Appetite for Destruction')
      expect(json['performer']).to eq('Guns & Roses')
      expect(json['cost']).to eq(20)
      expect(response).to have_http_status(200)
    end
  end

  def build_album
    Album.create!(title: 'Appetite for Destruction',
                  performer: 'Guns & Roses',
                  cost: 20)
  end
end
