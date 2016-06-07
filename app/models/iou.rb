class Iou < ActiveRecord::Base

  validates :title, :amount, :name, :contact, presence: true
  validates_format_of :amount, :with => /^\d+\.*\d{0,2}$/

end
