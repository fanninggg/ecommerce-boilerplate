class BasketItemsController < ApplicationController
  def index
  end

  def create
    @basket = find_or_create_basket
    @product_variant = ProductVariant.find(params[:product_variant_id])
    @basket_item = BasketItem.new(basket_item_params)
    @basket_item.basket = @basket
    @basket_item.product_variant = @product_variant
    if @basket_item.save
      redirect_to product_variants_path
    else
      raise
    end
  end

  def destroy
  end

  private

  def basket_item_params
    params.require(:basket_item).permit(:quantity)
  end
end
