require 'rails_helper'

RSpec.describe "TodayExercises", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/today_exercises/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/today_exercises/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/today_exercises/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/today_exercises/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/today_exercises/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
