class AttendancesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :is_author?, only: [:create]
  before_action :has_subscribed?, only: [:create]

  def index
  end

  # Display view with a form to subscribe to an event
  def new
    @attendance = Attendance.new
    @event = Event.find(params[:id])
  end

  # Create a new Attendance to an event
  def create
    # Get the event and it's attendance
    @event = Event.find(params[:id])
    @attendance = Attendance.find_by(event_id: @event.id)

    # Send customer's information to Stripe dashboard
    customer = Stripe::Customer.create(email: params[:stripeEmail], source: params[:stripeToken])

    # Send a charge request to Stripe
    puts charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @event.price.to_i * 100, #amount in cents
        description: 'Rails Stripe customer',
        currency: 'eur')

    # Subscribe current user to the event
    @event.users << current_user
    @event.save

    # Add stripe_customer_id to Attendance
    @attendance.stripe_customer_id = customer.id
    @attendance.save

    # Redirect and display success message
    flash[:success] = "Youuuuhouu ! Vous venez de vous inscrire à l'évènement '#{@event.title}' et mon porte monaaaay est maintenant alourdit par le pognon de dingue que vous venez de lâcher ! "
    redirect_to event_path(@event.id)
  end

  # Delete an event
  def destroy
    # Get the event
    @event = Event.find(params[:id])

    # If user is subscribed to the event
    if @event.users.include?(current_user)
      # Unsubscribe current_user from list of users
      p @event.users.delete(current_user)
      @event.save
    else
      # Can't unsubscribe a user \if he is not already subscribed
      flash[:error] = "Pour vous désinscrire de l'évènement, vous devriez déjà être inscrit"
    end

    redirect_to root_path
  end

end
