require 'rails_helper'

RSpec.describe "Products", type: :request do

  let(:valid_attributes) do
    {
      'id' => 1,
      'title' => 'Book',
      'description' => 'This is a book',
      'image_url' => 'image.jpg',
      'price' => 100 
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'title' => '1',
      'description' => '1234',
      'image_url' => 'picture',
      'price' => 'a' 
    }
  end

  describe "GET /index" do
    it "renders an successful response" do 
      get products_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders an successful response" do 
      get new_product_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders an successful response" do 
      product = Product.new(valid_attributes)
      get products_url(product)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders an successful response" do 
      product = Product.new(valid_attributes)
      product.save
      get edit_product_url(product)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "create new products" do
        expect do
          post = Product.new(valid_attributes)
          post.save
          post products_url, params: {product: valid_attributes}
        end.to change(Product, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create new products" do
        expect do
          post = Product.new(invalid_attributes)
          post.save
          post products_url, params: {product: invalid_attributes}
        end.to change(Product, :count).by(0)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested product" do 
      product = Product.new(valid_attributes)
      expect do
        delete products_url(product)
      end.to change(Product, :count).by(0)
    end
  end

end
