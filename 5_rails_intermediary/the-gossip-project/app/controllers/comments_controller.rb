class CommentsController < ApplicationController
  include ApplicationHelper
  # View list of comments (order most recents first)
  def index
    @comments = Comment.all.order("created_at DESC")
  end

  # View a comment
  def show
    @comment = Comment.find(params[:id])
  end

  # Display a view to create a comment
  def new
    @comment = Comment.new
  end

  # Create a new comment
  def create
    gossip = Gossip.find(params[:gossip])

    comment = Comment.new(gossip: gossip, user: current_user, content: params[:content])

    if comment.save
      flash[:success] = "Le potin a été créé avec succès."
      redirect_to gossip_path(id: Gossip.find(gossip.id))
    else
      redirect_to gossip_path(id: Gossip.find(gossip.id))
    end
  end

  # Display a view with a form to edit an existing comment
  def edit
    @comment = Comment.find(params[:id])
  end

  # Edit an existing comment
  def update
    comment = Comment.find(params[:id])

    if comment.update(content: params[:content])
      flash[:success] = "Le potin a été mis à jour avec succès."
      redirect_to gossip_path(id: comment.gossip.id)
    else
      render 'edit'
    end
  end

  # Delete a comment
  def destroy
    user_id = Comment.find(params[:id]).gossip.id
    Comment.find(params[:id]).delete
    redirect_to gossip_path(user_id)
  end
end
