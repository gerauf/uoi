class ChargesController < ApplicationController

  def new
    @iou = Iou.find(params[:iou_id])
  end

  def create
    @iou = Iou.find(params[:iou_id])
    @amount = (@iou.amount*100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )

    @iou.update_status

    rescue Stripe::CardError => e

    flash[:error] = e.message
    redirect_to new_iou_charge_path(@iou)
  end


end
