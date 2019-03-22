# frozen_string_literal: true

class PurchasesController < ApplicationController
  def create
    render json: Purchase.create!(purchase_params), status: :ok
  end

  private

  def purchase_params
    params.require(:purchase).permit(:user_id, :album_id)
  end
end
