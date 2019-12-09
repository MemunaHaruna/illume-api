require "rails_helper"

RSpec.describe "Illume API", type: :request do
  let(:user) { create(:user) }
  let!(:quotes) { 10.times { create(:quote, user: user) } }
  let!(:quote) { create(:quote, user: user, access: 1) } # private quote, should not be visible to non-logged in users

  describe "GET /api" do
    it "sends a list of quotes and a welcome message" do
      get "/api"
      expect(json[:meta][:message]).to eq "Welcome to Illume API!"
      expect(json[:quotes].count).to eq 10
      expect(Quote.visible_to(user).count).to eq 11 # private quote should be visible to quote creator
    end
  end
end
