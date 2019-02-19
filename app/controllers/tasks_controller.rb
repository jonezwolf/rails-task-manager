class TasksController < ApplicationController

before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task is drawn into here via before_action and set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    # ^ Model#create is Model#new + instance#save
    redirect_to tasks_path
    # redirects back to index for better UX
  end

  def edit
    # @task is drawn into here via before_action and set_task
  end

  def update
    # @task is drawn into here via before_action and set_task
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # @task is drawn into here via before_action and set_task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
