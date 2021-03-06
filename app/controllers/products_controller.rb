class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /products
  def index
    @products = Product.includes(:category)
    json_response(@products)
  end

  # POST /products
  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  # PUT /products/:id
  def update
    @product.update(product_params)
    head :no_content
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    # whitelist params
    params.permit(:title, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
