class UsersController < ApplicationController
  include ApplicationHelper

  # View list of Users (order most recents first)
  def index
    @gossips = Gossip.all.order("created_at DESC")
  end

  # View a User
  def show
    @user = User.find(params[:id])
  end

  # Display a view to create a Gossip
  def new
    @user = User.new
  end

  # Create a new Gossip
  def create
    user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        description: params[:description],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        age: params[:age],
        city: City.find(params[:city])
    )

    # Create a session for the new user
    log_in(user)

    if user.save
      flash[:success] = "Votre compte a bien été créé !"
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  # Display a view with a form to edit an existing Gossip
  def edit
  end

  # Edit an existing Gossip
  def update
  end

  # Delete a Gossip
  def destroy
  end
end
