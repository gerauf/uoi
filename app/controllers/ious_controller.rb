class IousController < ApplicationController

  before_action :authenticate_user!

  def new
    @iou = Iou.new
  end

  def create
    @iou = Iou.create(iou_params)
    if @iou.save
      redirect_to '/'
    else
      flash[:notice] = @iou.errors.full_messages
      render :new
    end
  end

  def update
    @iou = Iou.find(params[:id])
    if @iou.status == "created"
      @iou.status = "pending"
    elsif @iou.status == "pending"
      @iou.status = "paid"
    end
    @iou.save
    redirect_to '/'
  end

  def destroy
    @iou = Iou.find(params[:id])
    @iou.destroy
    flash[:notice] = 'Iou deleted'
    redirect_to '/'
  end

private

  def iou_params
    iou_user = {user: current_user}
    params.require(:iou).permit(:title,:amount,:name,:contact).merge(iou_user)
  end

end
