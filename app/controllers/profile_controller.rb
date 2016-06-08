class ProfileController < ApplicationController

  def index
    if current_user
      @ious = current_user.ious
    end
  end


end
