class BasketsController < ApplicationController
  def show
    @basket = find_or_create_basket
  end
end
