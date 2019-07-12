# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'Kisoro' }
    category { 'game' }
    price { 250 }
  end
end
