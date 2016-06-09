class IouMailer < ApplicationMailer
  default from: 'pmnbapp@gmail.com'

  def initial_email(iou)
    @iou = iou
    mail( to: @iou.contact, subject: 'pay me soon please')
  end

  def spam_email(iou)
    @iou = iou
    mail( to: @iou.contact, subject: 'pay me now!')
  end

  def self.send_spam(iou)
    spam_email(iou).deliver_now
  end


end
