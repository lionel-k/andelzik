# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  context '#index' do
    it 'have ok status' do
      get :index

      expect(response).to have_http_status(200)
    end

    it 'displays a welcome message' do
      get :index
      json = JSON.parse(response.body)

      expect(json['message']).to eq('Welcome to Andelzik API')
    end

    it 'displays availables endpoints' do
      get :index

      json = JSON.parse(response.body)
      root_path = 'https://andelzik.herokuapp.com'
      endpoints = [
        "GET #{root_path}/albums",
        "POST #{root_path}/albums",
        "GET #{root_path}/albums/:id",
        "PUT #{root_path}/albums/:id",
        "DELETE #{root_path}/albums/:id",
        "POST #{root_path}/purchases"
      ]

      expect(json['endpoints']).to eq(endpoints)
    end

    it 'displays the total number of albums, purchases and users' do
      3.times do |i|
        Album.create!(title: "title-#{i}",
                      performer: "performer-#{i}", cost: Random.rand(100))
      end

      4.times do |i|
        User.create!(name: "name#{i}")
      end

      5.times do
        Purchase.create!(album: Album.all.sample, user: User.all.sample)
      end

      stats = {
        numbers_of_albums: 3,
        numbers_of_users: 4,
        numbers_of_purchases: 5
      }.transform_keys!(&:to_s)

      get :index
      json = JSON.parse(response.body)

      expect(json['stats']).to eq(stats)
    end
  end
end
