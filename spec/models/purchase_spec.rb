# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  # Validations
  context 'Given valid data' do
    it 'should create a new purchase' do
      album = build_album
      user = build_user
      purchase = Purchase.create!(album: album, user: user)

      expect(purchase.user).to eq(user)
      expect(purchase.album).to eq(album)
    end
  end

  context 'With missing data' do
    it 'should validate that album_id and user_id are present' do
      album = build_album
      user = build_user

      purchase1 = Purchase.new(album: album)
      purchase2 = Purchase.new(user: user)
      expect(purchase1).not_to be_valid
      expect(purchase2).not_to be_valid
    end
  end

  it 'render the timestamp when the purchased were created_at' do
    album = build_album
    user = build_user

    purchase = Purchase.create(album: album, user: user)

    expect(purchase.created_at).not_to be_nil
  end
end
