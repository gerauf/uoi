class Iou < ActiveRecord::Base

  validates :title, :amount, :name, :contact, :user_id, presence: true
  validates :amount, numericality: {greater_than: 0}
  validates_format_of :contact,:with => Devise::email_regexp

  belongs_to :user

  def get_colour
    if self.status == "created"
      @card_colour = "red lighten-2"
    elsif self.status == "pending"
      @card_colour = "purple lighten-2"
    elsif self.status == "paid"
      @card_colour = "blue-grey lighten-4"
    end
  end

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
