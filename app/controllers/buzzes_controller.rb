class BuzzesController < ApplicationController
  def create
    render json: {accepted: true}
  end
end
