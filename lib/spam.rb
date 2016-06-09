class Spam

  def self.send_and_reschedule(item, mailer, time, reschedule_delay)
    unless item.status == 'paid'
      item.status = 'pending'
      mailer.send(item)
      Spam.delay({run_at: time + reschedule_delay}).send_and_reschedule(item, time, reschedule_delay, mailer)
    end
  end
end
