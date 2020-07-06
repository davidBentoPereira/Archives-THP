class EventsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!, except: [:index]
  before_action :is_validated?, only: [:show]

  # View list of events (order by most recents first)
  def index
    @events = Event.all.order('created_at DESC')
  end

  # Show an event
  def show
    @event = Event.find(params[:id])
  end

  # Display a view to create an event
  def new
    @event = Event.new
  end

  # Create a new event
  def create
    @event = Event.new(
        author: current_user,
        title: params[:event][:title],
        start_date: params[:event][:start_date],
        duration: params[:event][:duration],
        description: params[:event][:description],
        price: params[:event][:price],
        location: params[:event][:location],
        users: [current_user]
    )

    if @event.save
      flash[:success] = "L'évènement a été créé avec succès. Il est en attente de validation par un administrateur"
      redirect_to events_path(@event.id)
    else
      flash[:error] = "Ca sent la vieille trace de pneu pour toi mon coco..."
      render 'new'
    end
  end

  # Display a view with a form to edit an existing event
  def edit
    @event = Event.find(params[:id])
    # has_rights_user(@event)
  end

  # Edit an existing event
  def update
    @gossip = Gossip.find_by(title: params[:title])

    if @gossip.update(title: params[:title], content: params[:content], user: current_user)
      flash[:success] = 'Le potin a été mis à jour avec succès.'
      redirect_to gossips_path
    else
      render 'edit'
    end
  end

  # Delete an event
  def destroy
    Event.find(params[:id]).delete
    redirect_to events_path
  end

  def is_validated?
    @event =Event.find(params[:id])
    if @event.validated? === false
      flash[:error] = "L'évènement n'est pas encore validé!!!"
      redirect_to root_path
    end
  end

end
