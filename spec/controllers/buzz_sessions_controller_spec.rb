require 'rails_helper'

RSpec.describe BuzzSessionsController, type: :controller do

  it "creates a new buzz session with the winning buzz ID set to the next buzz" do
    last_buzz = Buzz.create!

    post :create

    expect(response.status).to eq(200)
    data = OpenStruct.new(JSON.parse(response.body))
    expect(data.winning_buzz_id).to eq(last_buzz.id + 1)
  end

  it "creates a new buzz session" do
    expect { post :create }.to change { BuzzSession.count }

    expect(response.status).to eq(200)
    data = OpenStruct.new(JSON.parse(response.body))
    expect(data.winning_buzz_id).to eq(1)
  end

  it 'deletes buzz sessions and associated buzzes' do
    buzz_session = BuzzSession.create!
    buzz_session.buzzes.create!

    post :delete_all

    expect(Buzz.all).to be_empty
    expect(BuzzSession.all).to be_empty
  end
end
