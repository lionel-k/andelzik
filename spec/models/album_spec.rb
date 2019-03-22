# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  # Validations
  context 'with valid data' do
    it 'should create an album' do
      album = build_custom_album(title: 'Komera', performer: 'Kidum', cost: 100)

      expect(album.persisted?).to be_truthy
      expect(album.title).to eq('Komera')
      expect(album.performer).to eq('Kidum')
      expect(album.cost).to eq(100)
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

  it 'should have last_purchased_at and last_purchased_by at nil' do
    album = build_album

    expect(album.last_purchased_at).to be_nil
    expect(album.last_purchased_by).to be_nil
  end

  it 'updates last_purchased_at of the album' do
    album = build_album
    user = build_user
    Purchase.create!(album: album, user: user)

    expect(album.last_purchased_at).not_to be_nil
  end

  it 'updates last_purchased_by of the album' do
    album = build_album
    user = build_user
    Purchase.create!(album: album, user: user)

    expect(album.last_purchased_by).to eq(user.name)
  end

  describe '#purchased_by!' do
    it 'updates the last_purchased columns' do
      album = build_album
      user = build_user

      album.purchased_by!(user)

      expect(album.last_purchased_by).to eq(user.name)
      expect(album.last_purchased_at).not_to be_nil
    end
  end
end
