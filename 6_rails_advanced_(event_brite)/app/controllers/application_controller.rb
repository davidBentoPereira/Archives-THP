# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:notice] = 'Vous devez être connecté pour créer un évènement.'

      redirect_to new_user_session_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  # Redirect towards Events/show \if user has already subscribed to the event
  def has_subscribed?
    @event = Event.find(params[:id])

    if @event.users.include?(current_user)
      flash[:notice] = "Vous êtes déjà inscrit à l'évènement"
      redirect_to event_path(@event.id)
    end
  end

  # Redirect towards Events/show \if user is the event's author
  def is_author?
    @event = Event.find(params[:id])

    if @event.author === current_user
      flash[:notice] = "Vous êtes déjà inscrit puisque vous êtes l'auteur de l'évènement"
      redirect_to event_path(@event.id)
    end
  end

  def is_admin?
    if current_user.is_admin === false
      flash[:error] = "Vous n'êtes pas administrateur"
      redirect_to root_path
    end
  end
end
