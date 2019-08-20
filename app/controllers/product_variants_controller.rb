class ProductVariantsController < ApplicationController
  def index
    @product_variants = ProductVariant.all
  end

  def show
    @product_variant = ProductVariant.find(params[:id])
  end
end
