class BuzzesController < ApplicationController
  def create
    render json: {accepted: false}
  end
end
