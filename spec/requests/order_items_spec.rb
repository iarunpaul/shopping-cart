require 'rails_helper'

RSpec.describe "OrderItems", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/order_items/create"
      expect(response).to have_http_status(:success)
    end
  end

end
