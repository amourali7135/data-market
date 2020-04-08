class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    inquiry = Inquiry.find(params[:inquiry_id])


    order  = Order.create!(inquiry: inquiry, inquiry_sku: inquiry.sku, amount: inquiry.price_cents, state: 'pending', user: current_user)




    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
    name: inquiry.title,
    images: [inquiry.buyer.photo],
    amount: inquiry.price_cents * 100,
    currency: 'usd',
    quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    # raise
  end

  def update
  end

  def delete
  end

  def edit
    @order = current_user.orders.find(params[:id])
  end
end
