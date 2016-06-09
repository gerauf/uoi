class ProfileController < ApplicationController

  def index
    if current_user
      @ious = current_user.ious.order(created_at: :desc)
    end
  end

end
