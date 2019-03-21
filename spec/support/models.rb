# frozen_string_literal: true

module Models
  def build_custom_album(title:, performer:, cost:)
    Album.create!(title: title, performer: performer, cost: cost)
  end

  def build_album
    build_custom_album(title: 'Collabo', performer: 'P Square', cost: 20)
  end

  def build_random_album
    build_custom_album(title: Faker::Music.album,
                       performer: Faker::Name.name,
                       cost: Random.rand(100))
  end

  def build_custom_user(name:)
    User.create!(name: name)
  end

  def build_user
    build_custom_user(name: 'Mandela')
  end

  def build_random_user
    build_custom_user(name: Faker::Name.name)
  end
end
