class BuzzSessionsController < ApplicationController
  def create
    buzz_session = BuzzSession.create(winning_buzz_id: winning_buzz_id)
    render json: {winning_buzz_id: buzz_session.winning_buzz_id}
  end

  def delete_all
    BuzzSession.destroy_all
    render json: {}
  end

  private

  def winning_buzz_id
    result = Buzz.connection.execute("select seq from sqlite_sequence where name='buzzes'").first
    result.present? ? result.fetch("seq").to_i + 1 : 1
  end
end
