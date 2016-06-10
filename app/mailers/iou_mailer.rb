class IouMailer < ApplicationMailer
  default from: 'pmnbapp@gmail.com'

  def initial_email(iou)
    @iou = iou
    @user = User.find(@iou.user_id)
    mail( to: @iou.contact, subject: 'Hi! Can you PLEASE PAY $OON')
  end

  def spam_email(iou)
    @iou = iou
    @user = User.find(@iou.user_id)
    mail( to: @iou.contact, subject: 'PAY ME NOW!')
  end

  def self.send_spam(iou)
    self.spam_email(iou).deliver_now
  end


end
