# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:performer) }
    it { should validate_presence_of(:cost) }
    it 'should check if cost is positive' do
      album = build(:album, cost: -3)
      expect(album).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:purchases).class_name('Purchase').dependent(:destroy) }
  end

  it 'should have last_purchased_at and last_purchased_by at nil' do
    album = create(:album)

    expect(album.last_purchased_at).to be_nil
    expect(album.last_purchased_by).to be_nil
  end

  it 'updates last_purchased_at of the album' do
    album = create(:album)
    user = create(:user)
    Purchase.create!(album: album, user: user)

    expect(album.last_purchased_at).not_to be_nil
  end

  it 'updates last_purchased_by of the album' do
    album = create(:album)
    user = create(:user)
    Purchase.create!(album: album, user: user)

    expect(album.last_purchased_by).to eq(user.name)
  end

  describe '#purchased_by!' do
    it 'updates the last_purchased columns' do
      album = create(:album)
      user = create(:user)

      album.purchased_by!(user)

      expect(album.last_purchased_by).to eq(user.name)
      expect(album.last_purchased_at).not_to be_nil
    end
  end
end
