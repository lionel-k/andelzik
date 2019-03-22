# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :album
  belongs_to :user, counter_cache: :total_purchases

  validates :user_id, :album_id, presence: true

  after_create :update_album_purchased_data

  private

  def update_album_purchased_data
    album.purchased_by!(user)
  end
end
