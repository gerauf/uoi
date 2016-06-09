class Iou < ActiveRecord::Base

  validates :title, :amount, :name, :contact, :user_id, presence: true
  validates :amount, numericality: {greater_than: 0}

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

  def get_order
    
  end

end
