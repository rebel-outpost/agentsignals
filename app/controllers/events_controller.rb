class EventsController < ApplicationController

  def index
    @events = current_user.tasks.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @event = Task.find params[:id]
    respond_to do |format|
      format.js
    end
  end
end
