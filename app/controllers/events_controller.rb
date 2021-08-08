class EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = current_user.events.all
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:user_id, :title, :body, :start_time, :end_time)
  end
end
