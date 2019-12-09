require "rails_helper"

RSpec.describe "Tags API", type: :request do
  let(:user) { create(:user) }
  let!(:tags) { 5.times { create(:tag) } }
  let(:headers) { valid_headers(user.id) }

  describe "GET /api/tags" do
    it "returns a list of tags" do
      get "/api/tags", headers: headers
      expect(json[:tags].count).to eq 5

      Tag.create!(name: 'vegan')
      get "/api/tags/?query=veg", headers: headers
      expect(json[:tags].count).to eq 1
    end
  end

  describe "POST /tags" do
    context "when tag already exists" do
      it "returns existing tag or error message" do
        Tag.create!(name: 'vanilla')
        post "/api/tags", params: { name: 'vanilla' }.to_json, headers: headers

        expect(json[:meta][:message]).to eq "Tag already exists"
        expect(json[:tags].count).to eq 1
      end
    end

    context "tag does not yet exist" do
      it "creates a new tag" do
        post "/api/tags", params: {name: 'random'}.to_json, headers: headers

        expect(json[:tag][:name]).to eq "Random"
      end
    end
  end
end
