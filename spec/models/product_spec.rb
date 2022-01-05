require 'rails_helper'

RSpec.describe Product, type: :model do

  it "has valid title" do
    product = Product.new(
      title: '',
      description: 'valid description',
      image_url: 'image.jpg',
      price: 100
    )

    expect(product).to_not be_valid
    product.title = "Has a title"
    expect(product).to be_valid
  end

  it "has valid description" do
    product = Product.new(
      title: 'valid title',
      description: '',
      image_url: 'image.jpg',
      price: 100
    )

    expect(product).to_not be_valid
    product.description = "Has a description"
    expect(product).to be_valid
  end

  it "has valid image " do
    product = Product.new(
      title: 'valid title',
      description: 'valid description',
      image_url: '',
      price: 100
    )

    expect(product).to_not be_valid
    product.image_url = "image.jpg"
    expect(product).to be_valid
  end

  it "has valid price" do
    product = Product.new(
      title: 'has title',
      description: 'valid description',
      image_url: 'image.jpg',
      price: nil 
    )

    expect(product).to_not be_valid
    product.price = 100
    expect(product).to be_valid
  end

end
