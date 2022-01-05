require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /index" do
    it "has redirects to products_url" do 
      expect(products_url).to eql("http://www.example.com/products")
    end

    it "has redirect to get new product url" do
      expect(new_product_url).to eql("http://www.example.com/products/new")
    end

    
  end
end
