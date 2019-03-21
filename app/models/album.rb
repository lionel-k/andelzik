# frozen_string_literal: true

class Album < ApplicationRecord
  validates :title, :performer, :cost, presence: true, allow_blank: false
  validates :cost, numericality: { greater_than: 0 }

  has_many :purchases, dependent: :destroy
end
