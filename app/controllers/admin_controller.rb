class AdminController < ApplicationController
  before_action :authenticate_user!, :check_admin

  def index

  end

  private
  def check_admin
    return redirect_to root_path if !current_user.is_admin?
  end

end
