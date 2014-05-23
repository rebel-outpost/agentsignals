class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @events = current_user.events
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.js
    end
  end

  def new_task
    @task = Task.new
  end

  def new_appointment
    @appointment = Appointment.new
  end

  def new_showing
    @showing = Showing.new
    @clients = current_user.clients
  end

  def show
    @event = Event.find params[:id]
  end

  def create
    @clients = current_user.clients
    @event = if params[:task]
      current_user.tasks.build task_params
    elsif params[:appointment]
      current_user.appointments.build appointment_params
    elsif params[:showing]
      current_user.showings.build showing_params
    end
    @task, @appointment, @showing = @event, @event, @event
    respond_to do |format|
      if @event.save
        format.html {redirect_to calendar_index_path, notice: "Event added successfully"}
        format.js
      else
        format.html do 
          if @event.type == "Task"
            render :new_task
          elsif @event.type == "Appointment"
            render :new_appointment
          elsif @event.type == "Showing"
            render :new_showing
          end
        end
        format.js
      end
    end
  end

  def edit
    @clients = current_user.clients
    @event = Event.find params[:id]
  end

  def update
    @clients = current_user.clients
    @event = Event.find params[:id]
    parameters = if params[:task]
      task_params
    elsif params[:appointment]
      appointment_params
    elsif params[:showing]
      showing_params
    elsif params[:event]
      event_params
    end
    if @event.update parameters
      respond_to do |format|
        format.html {redirect_to calendar_index_path, notice: "Event has been updated successfully"}
        format.js
      end
    end
  end

  def destroy
    @event = Event.find params[:id]
    @event.destroy
    respond_to do |format|
      format.html {redirect_to calendar_index_path, notice: "Event has been deleted successfully"}
      format.js
    end
  end

  private

  def event_params
    params.require(:event).permit!
  end

  def task_params
    params.require(:task).permit!
  end

  def appointment_params
    params.require(:appointment).permit!
  end

  def showing_params
    params.require(:showing).permit!
  end

end
