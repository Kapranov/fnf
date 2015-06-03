require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #minor" do
    it "returns http success" do
      get :minor
      expect(response).to have_http_status(:success)
    end
  end

end
