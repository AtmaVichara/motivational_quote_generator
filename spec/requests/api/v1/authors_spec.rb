require 'rails_helper'

describe "Authors API Endpoints" do
  describe "GET /api/v1/authors" do
    it "returns all authors" do
      create_list(:author, 6)

      get "/api/v1/authors"

      expect(response).to be_success

      authors = JSON.parse(response.body)

      expect(authors.length).to eq(6)
    end
  end

  describe "GET /api/v1/authors/:id" do
    it "returns author by id" do
      create_list(:author, 4)

      get "/api/v1/authors/3"
      
      expect(response).to be_success

      author = JSON.parse(response.body)

      expect(author['id']).to eq(3)
    end
  end
end
