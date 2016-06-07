class IousController < ApplicationController

  def new
    @iou = Iou.new
  end

  def create
    @iou = Iou.create(iou_params)
    byebug
    if @iou.save
      redirect_to '/ious/new'
    else
      flash[:notice] = @iou.errors.full_messages
      render :new
    end

  end

  def iou_params
    params.require(:iou).permit(:title, :amount, :name, :contact)
  end

end
