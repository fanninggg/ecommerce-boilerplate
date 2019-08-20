require 'test_helper'

class ProductVariantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_variants_index_url
    assert_response :success
  end

  test "should get new" do
    get product_variants_new_url
    assert_response :success
  end

  test "should get show" do
    get product_variants_show_url
    assert_response :success
  end

  test "should get edit" do
    get product_variants_edit_url
    assert_response :success
  end

end
