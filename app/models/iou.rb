class Iou < ActiveRecord::Base

  validates :title, :amount, :name, :contact, presence: true
  validates :amount, numericality: {greater_than: 0}

end
