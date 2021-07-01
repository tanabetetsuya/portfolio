require 'rails_helper'

RSpec.describe "Exercises", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/exercises/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/exercises/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/exercises/show"
      expect(response).to have_http_status(:success)
    end
  end

end
