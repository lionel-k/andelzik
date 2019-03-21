# frozen_string_literal: true

module Models
  def build_album(*)
    Album.create!(title: 'Collabo', performer: 'P Square', cost: 20)
  end

  def build_random_album
    build_album(Faker::Music.album, Faker::Name.name, Random.rand(100))
  end

  def build_user(*)
    User.create!(name: 'Mandela')
  end

  def build_random_user
    build_user(Faker::Name.name)
  end
end
