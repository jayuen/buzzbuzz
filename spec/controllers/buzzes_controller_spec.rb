require 'rails_helper'

RSpec.describe BuzzesController, type: :controller do
  before do
    BuzzSession.create! winning_buzz_id: 1
  end

  it "creates an accepted buzz when it's the first one of the buzz session" do
    post :create

    expect(response.status).to eq(200)
    data = OpenStruct.new(JSON.parse(response.body))
    expect(data.accepted).to eq(true)
  end

  it "does not create an accepted buzz when it's the second one" do
    Buzz.create!

    post :create

    expect(response.status).to eq(200)
    data = OpenStruct.new(JSON.parse(response.body))
    expect(data.accepted).to eq(false)
  end

  it "buzzes are associated with a buzz session" do
    expect do
      post :create
    end.to change { BuzzSession.last.buzzes.size }
  end
end
