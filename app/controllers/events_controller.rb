class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = current_user.tasks.all
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

  def show
    @event = Task.find params[:id]
    respond_to do |format|
      format.js
    end
  end

  def create
    respond_to do |format|
      format.js
    end
  end

  def update
    if params[:event][:type] == "Task"
      @task = Task.find params[:id]
      @task.update_attributes task_params
      respond_to do |format|
        format.json {render json: {status: 200}}
      end
    end
  end

  def destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def task_params
    params.require(:event).permit(:name, :due_date)
  end

end
