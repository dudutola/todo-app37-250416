class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def toggle_completed
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed)
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :due_date, :recurrence, :completed)
  end
end
