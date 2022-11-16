class TasksController < ApplicationController
  def tasks
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  def create
    @tasks = Task.new(task_params)
    @tasks.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path(@tasks)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task = Task.update(params[:task])
    redirect_to tasks_path(@tasks)

  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to tasks_path, status: :see_other

  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
