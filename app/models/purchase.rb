# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :album
  belongs_to :user

  validates :user_id, :album_id, presence: true
end
