class BuzzesController < ApplicationController
  def create
    buzz_session = BuzzSession.last

    if buzz_session.present?
      buzz_in(buzz_session)
    else
      render json: { error: 'No buzz session. POST to /buzz_sessions first to create a new session' }, status: 422
    end
  end

  def buzz_in(buzz_session)
    existing_buzz = Buzz.where(buzz_session_id: buzz_session.id, name: params[:name])
    if existing_buzz.present?
      render json: { error: "#{params[:name]} already buzzed in" }, status: 422
    else
      create_buzz(buzz_session)
    end
  end

  def create_buzz(buzz_session)
    buzz = Buzz.create! buzz_session_id: buzz_session.id, name: params[:name]
    winner = (buzz.id == buzz_session.winning_buzz_id)
    notify(buzz, winner)
    render json: {id: buzz.id, name: buzz.name, winner: winner}
  end

  def notify(buzz, winner)
    $redis.publish('buzz', {id: buzz.id, name: buzz.name, winner: winner}.to_json)
  end
end
