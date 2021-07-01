require 'rails_helper'

RSpec.describe "ExerciseSuggestions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/exercise_suggestions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/exercise_suggestions/create"
      expect(response).to have_http_status(:success)
    end
  end

end
