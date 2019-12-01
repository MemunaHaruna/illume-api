require "rails_helper"

RSpec.describe "Illume API", type: :request do
  describe "GET /" do
    it "sends a welcome message" do
      get "/"
      expect(json[:message]).to eq "Welcome to Illume!"
    end
  end
end
