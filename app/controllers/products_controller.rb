# frozen_string_literal: true

class ProductsController < ApplicationController
  def search
    render json: Product.search(term)
  end

  private

  def term
    params[:term]
  end
end
