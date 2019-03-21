# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  # Validations

  context 'with valid data' do
    it 'should create an album with valid data' do
      album = build_album

      expect(album.title).to eq('Black and Blue')
      expect(album.performer).to eq('The Rolling Stones')
      expect(album.cost).to eq(20)
    end
  end

  context 'with invalid data' do
    it 'should not create an album with missing data' do
      album1 = Album.new(title: 'The album')
      album2 = Album.new(performer: 'The album')
      album3 = Album.new(cost: 23)

      expect(album1).not_to be_valid
      expect(album2).not_to be_valid
      expect(album3).not_to be_valid
    end

    it 'should check if cost is positive' do
      album = Album.new(title: 'The album',
                        performer: 'The performer',
                        cost: -3)

      expect(album).not_to be_valid
    end

    it 'should raise an error' do
      expect { Album.create! }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  # Associations
  it 'renders the purchase belonging to an album' do
    user = build_user
    album = build_album

    10.times do
      Purchase.create!(album: build_random_album, user: user)
    end

    3.times do
      Purchase.create!(album: album, user: user)
    end

    album_purchases = Purchase.where(album: album)

    expect(album.purchases).to eq(album_purchases)
  end

  def build_album
    Album.create(title: 'Collabo',
                 performer: 'P Square',
                 cost: 20)
  end

  def build_random_album
    Album.create(title: Faker::Music.album,
                 performer: Faker::Name.name,
                 cost: 20)
  end

  def build_user
    User.create(name: 'Mandela')
  end
end
