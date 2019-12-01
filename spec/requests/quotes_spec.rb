require "rails_helper"

RSpec.describe "Quotes API", type: :request do
  let(:user) { create(:user) }
  let(:user_2) { create(:user) }
  let!(:quotes) { 5.times { create(:quote, user: user) } }
  let!(:quote) { create(:quote, user: user_2, access: 1)}
  let(:headers) { valid_headers(user.id) }
  let(:headers_2) { valid_headers(user_2.id)}
  let(:quote_params) { valid_quote_params }

  describe "GET /quotes" do
    it "returns a list of quotes visible to current_user" do
      expect(Quote.count).to eq 6 # last quote is private and belongs to user_2

      get "/quotes", headers: headers
      expect(json[:quotes].count).to eq 5

      get "/quotes", headers: headers_2
      expect(json[:quotes].count).to eq 6
    end
  end

  describe "GET /quotes/:id" do
    context "when requested quote is visible to current_user" do
      it "returns the requested quote" do
        requested_quote = Quote.first
        get "/quotes/#{requested_quote.id}", headers: headers
        expect(json[:quote][:id]).to eq requested_quote.id
      end
    end
    context "when requested quote is not visible to current_user" do
      it "returns an error message" do
        requested_quote = quote
        get "/quotes/#{requested_quote.id}", headers: headers
        expect(response.status).to eq 404
      end
    end
  end

  describe "POST /quotes" do
    context "when valid params" do
      it "creates a new quote" do
        post "/quotes", params: quote_params.to_json, headers: headers

        expect(json[:quote][:content]).to eq quote_params[:content]
        expect(json[:quote][:author]).to eq quote_params[:author].titlecase
        expect(json[:quote][:user][:id]).to eq user.id
      end
    end

    context "when invalid params" do
      it "returns an error message" do
        new_quote = quote_params.except(:content)
        post "/quotes", params: new_quote.to_json, headers: headers

        expect(json[:message]).to eq "Error while creating a quote"
        expect(json[:errors]).to eq "Validation failed: Content can't be blank"
      end
    end
  end

  describe "PUT /quotes/:id" do
    context "when valid params" do
      it "updates the quote" do
        quote_to_edit = Quote.second

        put "/quotes/#{quote_to_edit.id}", params: {content: 'edited content', author: 'Anaconda'}.to_json, headers: headers

        expect(json[:quote][:content]).to eq "edited content"
        expect(json[:quote][:author]).to eq "Anaconda"
        expect(json[:quote][:user][:id]).to eq user.id
      end
    end

    context "when invalid params" do
      it "returns an error message" do
        quote_to_edit = Quote.first

        put "/quotes/#{quote_to_edit.id}", params: {content: nil}.to_json, headers: headers

        expect(json[:message]).to eq "Error while updating a quote"
        expect(json[:errors]).to include "Content can't be blank"
      end
    end

    context "when quote belongs to another user" do
      it "returns an error message" do
        put "/quotes/#{quote.id}", params: {content: 'Hey there, Delilah!'}.to_json, headers: headers

        expect(response.status).to eq 404
      end
    end
  end

  describe "DELETE /quotes/:id" do
    context "when quote belongs to current_user" do
      it "destroys the quote" do
        quote_to_delete = Quote.first

        delete "/quotes/#{quote_to_delete.id}", headers: headers

        expect(json[:message]).to eq "Successfully deleted a quote"
        expect(response.status).to eq 200
      end
    end

    context "when quote does not belong to current_user" do
      it "returns an error message" do
        quote_to_delete = Quote.first
        delete "/quotes/#{quote_to_delete.id}", headers: headers_2

        expect(response.status).to eq 404
      end
    end
  end
end
