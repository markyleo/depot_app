require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /index" do
    it "renders an successful response" do 
      get store_index_url
      expect(response).to be_successful
    end
  end
end
