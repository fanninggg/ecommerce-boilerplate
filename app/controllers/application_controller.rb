class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

# Need to add a combine baskets condition if a user logs in after adding items
# to their session based basket which transfers the items over to their devise basket

  def find_or_create_basket
    if current_user
      if current_user.basket && session[:basket_id]
        combine_baskets
      end
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

  def combine_baskets
    old_basket = Basket.find(session[:basket_id])
    session[:basket_id] = nil
    new_basket = current_user.basket
    old_basket.basket_items.each do |item|
      item.update(basket: new_basket)
    end
    old_basket.destroy
    new_basket
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
