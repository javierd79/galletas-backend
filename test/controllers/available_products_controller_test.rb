require "test_helper"

class AvailableProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @available_product = available_products(:one)
  end

  test "should get index" do
    get available_products_url, as: :json
    assert_response :success
  end

  test "should create available_product" do
    assert_difference("AvailableProduct.count") do
      post available_products_url, params: { available_product: { description: @available_product.description, name: @available_product.name, price: @available_product.price, quantity: @available_product.quantity } }, as: :json
    end

    assert_response :created
  end

  test "should show available_product" do
    get available_product_url(@available_product), as: :json
    assert_response :success
  end

  test "should update available_product" do
    patch available_product_url(@available_product), params: { available_product: { description: @available_product.description, name: @available_product.name, price: @available_product.price, quantity: @available_product.quantity } }, as: :json
    assert_response :success
  end

  test "should destroy available_product" do
    assert_difference("AvailableProduct.count", -1) do
      delete available_product_url(@available_product), as: :json
    end

    assert_response :no_content
  end
end
