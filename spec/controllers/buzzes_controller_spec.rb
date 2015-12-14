require 'rails_helper'

RSpec.describe BuzzesController, type: :controller do
  it "requires a buzz_session" do
    post :create

    expect(response.status).to eq(422)
    data = OpenStruct.new(JSON.parse(response.body))
    expect(data.error).to match(/No buzz session/)
  end

  it "creates an winning buzz when it's the first one of the buzz session" do
    create_buzz_session
    post :create

    expect(response.status).to eq(200)
    data = OpenStruct.new(JSON.parse(response.body))
    expect(data.winner).to eq(true)
  end

  it "does not create an winning buzz when it's the second one" do
    create_buzz_session
    Buzz.create!

    post :create

    expect(response.status).to eq(200)
    data = OpenStruct.new(JSON.parse(response.body))
    expect(data.winner).to eq(false)
  end

  it "does not allow buzzing twice for the same session, same name" do
    create_buzz_session
    Buzz.create!

    post :create, name: 'team1'
    post :create, name: 'team1'

    expect(response.status).to eq(422)
    data = OpenStruct.new(JSON.parse(response.body))
    expect(data.error).to match(/already buzzed in/)
  end

  it "buzzes are associated with a buzz session" do
    create_buzz_session

    expect do
      post :create
    end.to change { BuzzSession.last.buzzes.size }
  end

  def create_buzz_session
    BuzzSession.create! winning_buzz_id: 1
  end
end
