class IouMailerPreview < ActionMailer::Preview

  def initial_email_preview
    IouMailer.initial_email(Iou.first)
  end

  def spam_email_preview
    IouMailer.spam_email(Iou.first)
  end

end
