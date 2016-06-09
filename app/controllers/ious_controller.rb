require 'Spam'

class IousController < ApplicationController

  before_action :authenticate_user!

  def new
    @iou = Iou.new
  end

  def create
    @iou = Iou.create(iou_params)
    if @iou.save
      IouMailer.initial_email(@iou).deliver_now
      redirect_to '/'
    else
      flash[:notice] = @iou.errors.full_messages
      render :new
    end
  end

  def edit
    @iou = Iou.find(params[:id])
  end

  def update
    @iou = Iou.find(params[:id])
    @iou.status = 'pending'
    @iou.save
    Spam.send_and_reschedule(@iou, IouMailer,Time.new, 100)
    redirect_to '/'
  end

  def iou_params
    iou_user = {user: current_user}
    params.require(:iou).permit(:title,:amount,:name,:contact).merge(iou_user)
  end

end
