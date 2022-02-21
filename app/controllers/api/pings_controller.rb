class Api::PingsController < ApplicationController
  def index
    render json: { messagge: 'pong'}
  end
end
