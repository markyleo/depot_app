require 'rails_helper'

RSpec.describe "LineItems", type: :request do

  fixtures :products,:line_items

  describe "GET /index" do
    it "renders an successful response" do 
      get line_items_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders an successful response" do 
      get new_line_item_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders an successful response" do 
      line_items = LineItem.new()
      get line_items_url(line_items)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "create new Line Items" do
      expect do
        post = LineItem.new()
        post.save
        post line_items_url, params: { product_id: products(:ruby).id  }
      end.to change(LineItem, :count).by(1)
    end
  end

end
