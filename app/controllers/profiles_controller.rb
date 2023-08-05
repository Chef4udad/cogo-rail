class ProfilesController < ApplicationController

  def show
    @user = set_current_user
    render json: @user
  end

end
