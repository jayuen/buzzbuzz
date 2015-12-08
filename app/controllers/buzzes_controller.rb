class BuzzesController < ApplicationController
  def create
    expected_sequence = BuzzSession.last.next_buzz_sequence
    buzz = Buzz.create!
    render json: { :accepted => (buzz.id == expected_sequence) }
  end
end
