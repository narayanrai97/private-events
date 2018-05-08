class EventsController < ApplicationController
  def index
    @events = Event.upcoming_events
  end
  
  def past_events
    @past_events = Event.past_events
  end

  def new
    @event = Event.new
  end
  
  def create
    # @user = User.find(params[:id])
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created"
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  
  private
    def event_params
      params.require(:event)
            .permit(:date, :description)
    end
end
