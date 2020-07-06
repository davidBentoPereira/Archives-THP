class ApplicationController < ActionController::Base
  include ApplicationHelper

  def authenticate_user
    unless session[:user_id] && current_user
      puts params
      @user = User.new
      render 'sessions/new'
    end
  end
end
