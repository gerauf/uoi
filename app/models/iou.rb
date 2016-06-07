class Iou < ActiveRecord::Base

  validates :title, :amount, :name, :contact, presence: true

end
