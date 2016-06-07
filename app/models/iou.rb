class Iou < ActiveRecord::Base

  validates :title, :amount, :name, :contact, :user_id, presence: true
  validates :amount, numericality: {greater_than: 0}

  belongs_to :user


end
