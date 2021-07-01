require 'rails_helper'

RSpec.describe "ExerciseMenus", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/exercise_menus/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/exercise_menus/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/exercise_menus/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/exercise_menus/show"
      expect(response).to have_http_status(:success)
    end
  end

end
