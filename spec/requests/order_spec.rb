require 'rails_helper'

RSpec.describe "Orders", type: :request do

  let(:valid_attributes) do
    {
      'id' => 1,
      'address' => 'This is valid address',
      'email' => 'valid@email.com',
      'name' => 'Valid Name',
      'pay_type' => 'Check' 
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'address' => '123',
      'email' => 'abc123',
      'name' => 'name_me',
      'pay_type' => ''
    }
  end

  describe "GET /index" do
    it "renders an successful response" do 
      get orders_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders an successful response" do 
      orders = Order.new(valid_attributes)
      get orders_url(orders)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "create new Order" do
        expect do
          post = Order.new(valid_attributes)
          post.save
          post orders_url, params: {order: valid_attributes}
        end.to change(Order, :count).by(2)
      end
    end

    context "with invalid parameters" do
      it "does not create new order" do
        expect do
          post = Order.new(invalid_attributes)
          post.save
          post orders_url, params: {order: invalid_attributes}
        end.to change(Order, :count).by(0)
      end
    end
  end

end
