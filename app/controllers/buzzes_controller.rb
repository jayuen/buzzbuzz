class BuzzesController < ApplicationController
  def create
    buzz_session = BuzzSession.last

    if buzz_session.present?
      winning_buzz_id = buzz_session.winning_buzz_id
      buzz = Buzz.create! buzz_session_id: buzz_session.id, name: params[:name]
      render json: { :winner => (buzz.id == winning_buzz_id) }
    else
      render json: { error: 'No buzz session. POST to /buzz_sessions first to create a new session' }, status: 422
    end
  end
end
