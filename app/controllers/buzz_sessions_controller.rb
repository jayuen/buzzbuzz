class BuzzSessionsController < ApplicationController
  def create
    BuzzSession.create(winning_buzz_id: winning_buzz_id)
    notify_create
    render nothing: true
  end

  def delete_all
    BuzzSession.destroy_all
    render json: {}
  end

  def index
  end

  private

  def notify_create
    WebsocketRails[:buzz_sessions].trigger(:new, {timestamp: Time.zone.now.strftime("%I:%M:%S %p")})
  end

  def winning_buzz_id
    result = Buzz.connection.execute("select seq from sqlite_sequence where name='buzzes'").first
    result.present? ? result.fetch("seq").to_i + 1 : 1
  end
end
