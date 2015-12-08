class BuzzSessionsController < ApplicationController
  def create
    buzz_session = BuzzSession.create(winning_buzz_id: Buzz.maximum(:id).to_i + 1)
    render json: {winning_buzz_id: buzz_session.winning_buzz_id}
  end

  def delete_all
    BuzzSession.destroy_all
    render json: {}
  end
end
