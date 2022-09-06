class AvailableProductsController < ApplicationController
  before_action :set_available_product, only: %i[ show update destroy ]

  # GET /available_products
  def index
    @available_products = AvailableProduct.all

    render json: @available_products
  end

  # GET /available_products/1
  def show
    render json: @available_product
  end

  # POST /available_products
  def create
    @available_product = AvailableProduct.new(available_product_params)

    if @available_product.save
      render json: @available_product, status: :created, location: @available_product
    else
      render json: @available_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /available_products/1
  def update
    if @available_product.update(available_products_buy)
      render json: @available_product
    else
      render json: @available_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /available_products/1
  def destroy
    @available_product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_product
      @available_product = AvailableProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def available_product_params
      params.require(:available_product).permit(:name, :description, :quantity, :price)
    end

    def available_products_buy
      params.require(:available_product).permit(:quantity)
    end
end
