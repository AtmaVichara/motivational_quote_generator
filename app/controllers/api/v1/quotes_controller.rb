class Api::V1::QuotesController < ApplicationController

  def index
    render json: Quote.all
  end

  def show
    render json: Quote.find(params[:id])
  end

end
