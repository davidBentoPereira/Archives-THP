class GossipsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user, except: [:index]

  # View list of gossips (order most recents first)
  def index
    @gossips = Gossip.all.order('created_at DESC')
  end

  # View a gossip && all it's comments && a form to create a new comment
  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.all.where(gossip_id: params[:id]).order('created_at DESC')
    @comment = Comment.new(gossip: @gossip, user: User.find(@gossip.user.id), content: '')
  end

  # Display a view to create a gossip
  def new
    @gossip = Gossip.new
  end

  # Create a new gossip
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)

    if @gossip.save
      flash[:success] = 'Le potin a été créé avec succès.'
      redirect_to gossips_path
    else
      render 'new'
    end
  end

  # Display a view with a form to edit an existing gossip
  def edit
    @gossip = Gossip.find(params[:id])
    has_rights_user(@gossip)
  end

  # Edit an existing gossip
  def update
    @gossip = Gossip.find_by(title: params[:title])

    if @gossip.update(title: params[:title], content: params[:content], user: current_user)
      flash[:success] = 'Le potin a été mis à jour avec succès.'
      redirect_to gossips_path
    else
      render 'edit'
    end
  end

  # Delete a gossip
  def destroy
    Gossip.find(params[:id]).delete
    redirect_to gossips_path
  end
end
