class OrdersController < ApplicationController
  before_action :logged_in_user, only: %i(new create)
  before_action :current_cart, :load_product_in_cart
  before_action :check_product_quantity, only: %i(new create)

  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.new order_params
    if @order.valid?
      create_transaction
    else
      flash.now[:danger] = t ".order_fail"
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:amount, order_details_attributes:
                                 [:price, :quantity])
  end

  def create_transaction
    ActiveRecord::Base.transaction do
      @order.save!
      clear_carts
      redirect_to root_path
      flash[:success] = t ".success_checkout"
    end
  rescue StandardError
    flash[:danger] = t ".danger_checkout"
    redirect_to carts_path
  end
end
