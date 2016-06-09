class Iou < ActiveRecord::Base

  validates :title, :amount, :name, :contact, :user_id, presence: true
  validates :amount, numericality: {greater_than: 0}
  validates_format_of :contact,:with => Devise::email_regexp

  belongs_to :user


  def send_and_reschedule(mailer)
    unless self.status == 'paid'
      mailer.send_spam(self)
      self.delay(run_at: Time.new + 100).send_and_reschedule(mailer)
    end
  end

  def update_status
    self.status == 'pending' ? self.status = 'paid' : self.status = 'pending'
  end
end
