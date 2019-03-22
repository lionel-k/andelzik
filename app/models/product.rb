# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :category, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  def self.search(term)
    Product
      .where('name ~* ?', term.to_s)
      .or(where('category ~* ?', term.to_s))
  end
end
