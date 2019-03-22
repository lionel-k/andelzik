# frozen_string_literal: true

class Album < ApplicationRecord
  validates :title, :performer, :cost, presence: true, allow_blank: false
  validates :cost, numericality: { greater_than: 0 }

  has_many :purchases, dependent: :destroy

  def purchased_by!(user)
    update(last_purchased_by: user.name, last_purchased_at: Time.current)
  end
end
