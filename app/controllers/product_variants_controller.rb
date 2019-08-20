class ProductVariantsController < ApplicationController
  def index
    @product_variants = ProductVariant.all
  end

  def show
    @product_variant = ProductVariant.find(params[:id])
  end

  def new
    @product_variant = ProductVariant.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product_variant = ProductVariant.new(variant_params)
    @product = Product.find(params[:product_id])
    @product_variant.product = @product
    if @product_variant.save
      redirect_to product_variants_path
    else
      render :new
    end
  end

  def edit
    @product_variant = ProductVariant.find(params[:id])
  end

  def update
    @product_variant = ProductVariant.find(params[:id])
    if @product_variant.update(variant_params)
      redirect_to product_variants_path(@product_variant)
    else
      render :new
    end
  end

  def destroy
    @product_variant = ProductVariant.find(params[:id])
    @product_variant.destroy
    redirect_to categories_path
  end

  private

  def variant_params
    params.require(:product_variant).permit(:name, :SKU, :price, :product_id)
  end
end
