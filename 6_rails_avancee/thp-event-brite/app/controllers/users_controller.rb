class UsersController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!

  def index
    @users = User.all
    # redirect_to :root
  end

  def edit
    @user = User.find_by(first_name: params[:first_name])

    has_rights_user(@gossip)

    if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: current_user)
      flash[:success] = 'Votre profil a été mis à jour.'
      #redirect_to user_path
    else
      render 'edit'
    end
  end

  def update

  end

  def show
    @user = User.find(params[:id])

  end
end
