class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save
      redirect_back fallback_location: products_path
    else
      render 'orders/new'
    end
  end

  private

  def address_params
    params.require(:address).permit(:name, :line1, :line2, :postcode, :city, :county)
  end
end
