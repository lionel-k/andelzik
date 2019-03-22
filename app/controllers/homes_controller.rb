# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    render json: data, status: :ok
  end

  private

  def message
    { message: 'Welcome to Andelzik API' }
  end

  def endpoints
    root_path = 'https://andelzik.herokuapp.com'
    data = [
      "GET #{root_path}/albums",
      "POST #{root_path}/albums",
      "GET #{root_path}/albums/:id",
      "PUT #{root_path}/albums/:id",
      "DELETE #{root_path}/albums/:id",
      "POST #{root_path}/purchases",
      "GET #{root_path}/search"
    ]
    { endpoints: data }
  end

  def stats
    data = {
      numbers_of_albums: Album.count,
      numbers_of_users: User.count,
      numbers_of_purchases: Purchase.count,
      numbers_of_products: Product.count
    }
    { stats: data }
  end

  def data
    message.merge(endpoints).merge(stats)
  end
end
