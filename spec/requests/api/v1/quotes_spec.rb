require 'rails_helper'

describe "Quotes API Endpoints" do
  describe "GET /api/v1/quotes" do
    it "returns all quotes" do
      create_list(:quote, 10)

      get "/api/v1/quotes"

      expect(response).to be_success

      quotes = JSON.parse(response.body)

      expect(quotes.length).to eq(10)
    end
  end

  describe "GET /api/v1/quotes/:id" do
    it "returns quote by id" do
      create_list(:quote, 10)

      get "/api/v1/quotes/3"

      expect(response).to be_success

      quote = JSON.parse(response.body)

      expect(quote['id']).to eq(3)
      expect(quote).to be_a(Hash)
    end
  end
end
