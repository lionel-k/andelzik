# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # Validations
  context 'With valid data' do
    it 'should create a new user' do
      user = build_user('Mandela')

      expect(user.persisted?).to be_truthy
      expect(user.name).to eq('Mandela')
    end
  end

  context 'With invalid data' do
    it 'should raise an error' do
      expect { User.create! }.to raise_error(ActiveRecord::NotNullViolation)
    end

    it 'considers the object as invalid with empty name' do
      user = User.new(name: '')
      expect(user).not_to be_valid
    end
  end

  # Assocations
  it 'returns the list of purchases done by the user' do
    user = build_user
    album = build_album

    10.times do
      Purchase.create!(album: album, user: build_random_user)
    end

    3.times do
      Purchase.create!(album: album, user: user)
    end

    user_purchases = Purchase.where(user: user)

    expect(user.purchases).to eq(user_purchases)
  end
end
