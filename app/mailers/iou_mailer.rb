class IouMailer < ApplicationMailer
  default from: 'pmnbapp@gmail.com'

  def initial_mail(iou)
    @iou = iou
    mail( to: @iou.contact, subject: 'lol')
  end

end
