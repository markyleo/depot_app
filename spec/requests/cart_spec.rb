require 'rails_helper'

RSpec.describe "Carts", type: :request do

  describe "GET /index" do
    it "renders an successful response" do 
      get carts_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders an successful response" do 
      get new_cart_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders an successful response" do 
      carts = Cart.new()
      get carts_url(carts)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders an successful response" do 
      carts = Cart.new()
      carts.save
      get edit_cart_url(carts)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "create new carts" do
        expect do
          post = Cart.new()
          post.save
          post carts_url, params: {cart: {}}
        end.to change(Cart, :count).by(2)
      end
    end
  end
  
  describe "DELETE /destroy" do
    it "destroys the requested carts" do 
      carts = Cart.new()
      expect do
        delete carts_url(carts)
      end.to change(Cart, :count).by(1)
    end
  end

end
