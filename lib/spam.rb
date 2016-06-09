class Spam

  def self.send_and_reschedule(item, mailer, time, reschedule_delay)
    mailer.send_spam(item)
    Spam.delay({run_at: time + reschedule_delay}).send_and_reschedule(item, time, reschedule_delay, mailer)
  end
end
