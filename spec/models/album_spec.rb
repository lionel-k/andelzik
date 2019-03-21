# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  # Validations
  context 'with valid data' do
    it 'should create an album with valid data' do
      album = build_album

      expect(album.title).to eq('Collabo')
      expect(album.performer).to eq('P Square')
      expect(album.cost).to eq(20)
    end
  end

  context 'with invalid data' do
    it 'considers the object as invalid' do
      album1 = Album.new(title: 'The album')
      album2 = Album.new(performer: 'The album')
      album3 = Album.new(cost: 23)

      expect(album1).not_to be_valid
      expect(album2).not_to be_valid
      expect(album3).not_to be_valid
    end

    it 'should not allow blank values' do
      album = Album.new(title: '', performer: '', cost: 12)
      expect(album).not_to be_valid
    end

    it 'should check if cost is positive' do
      album = Album.new(title: 'The album',
                        performer: 'The performer',
                        cost: -3)

      expect(album).not_to be_valid
    end

    it 'should raise an error' do
      expect { Album.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  # Associations
  it 'returns the purchase belonging to an album' do
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
end
