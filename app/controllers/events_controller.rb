class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.user_id = current_user.id
    event.save
    redirect_to events_path
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @events = Event.all
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:user_id, :title, :body, :start_time, :end_time)
  end
end
