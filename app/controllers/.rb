class TasksController < ApplicationController
  def index
    @tasklists = Task.all
  end

  def show
    @tasklists = Task.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
