class BuzzesController < ApplicationController
  def create
    buzz_session = BuzzSession.last
    winning_buzz_id = buzz_session.winning_buzz_id
    buzz = Buzz.create! buzz_session_id: buzz_session.id, name: params[:name]
    render json: { :accepted => (buzz.id == winning_buzz_id) }
  end
end
