class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

# Need to add a combine baskets condition if a user logs in after adding items
# to their session based basket which transfers the items over to their devise basket

  def find_or_create_basket
    if current_user
      if current_user.basket
        current_user.basket
      else
        Basket.create(user: current_user)
      end
    else
      if session[:basket_id] && Basket.find(session[:basket_id])
        Basket.find(session[:basket_id])
      else
        basket = Basket.create
        session[:basket_id] = basket.id
        basket
      end
    end
  end
end
