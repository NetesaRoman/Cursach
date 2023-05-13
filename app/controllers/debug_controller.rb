class DebugController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def admin
    unless current_user.admin?
      redirect_to 'ping', allow_other_host: true
    end
  end
end
