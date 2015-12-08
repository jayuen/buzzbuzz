class BuzzesController < ApplicationController
  def create
    buzz_session = BuzzSession.last
    expected_sequence = buzz_session.next_buzz_sequence
    buzz = Buzz.create! buzz_session_id: buzz_session.id, name: params[:name]
    render json: { :accepted => (buzz.id == expected_sequence) }
  end
end
