# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  has_many :purchases, dependent: :destroy
end
