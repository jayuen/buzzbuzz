require 'rails_helper'

RSpec.describe BuzzesController, type: :controller do
  it "create an accepted buzz when it's the first one" do
    post :create

    expect(response.status).to eq(200)
    data = OpenStruct.new(JSON.parse(response.body))

    expect(data.accepted).to eq(true)
  end
end
