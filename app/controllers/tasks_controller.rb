class TasksController < ApplicationController

  def index
    # binding.pry
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
    @task_due_dates = Task.due_dates
    @task_types = Task.task_type
    @task_owners = current_user.account.users.map(&:email)
    @leads = Lead.all.map(&:email)
  end

  def show
    @task = Task.find params[:id]
    @task_due_dates = Task.due_dates
    @task_types = Task.task_type
    @task_owners = current_user.account.users.map(&:email)
    @leads = Lead.all.map(&:email)
  end

  def create
    tasks_params[:due_date] = Date.strptime(tasks_params[:due_date], "%m/%d/%Y")
    @task = Task.create(tasks_params)
    @task.user = User.where(email: @task.assigned_to).first
    if @task.save
      redirect_to tasks_path, flash: { notice: 'New Task Created'}
      TaskMailer.notify_new_task(@task.user, @task).deliver
    else
      render :new
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path, flash: { notice: 'Task Deleted'}
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes(tasks_params)
      task_owner = User.where(email: @task.assigned_to).first
      redirect_to tasks_path, flash: { notice: 'Task Updated'}
      TaskMailer.notify_updated_task(task_owner, @task).deliver
    else
      redirect_to task_path, flash: { notice: 'Unable to update task.'}
    end
  end



  def tasks_params
    params.require(:task).permit! if params[:task]
  end

end
