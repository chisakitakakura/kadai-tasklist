class TasksController < ApplicationController
   before_action :set_tasklist, only: [:show, :edit, :update, :destroy]
  def index
    @tasklists = Task.all
  end

  def show
  end

  def new
    @tasklist = Task.new
  end

  def create
     @tasklist = Task.new(tasklist_params)

    if @tasklist.save
      flash[:success] = 'Tasklist が正常に投稿されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @tasklist.update(tasklist_params)
      flash[:success] = 'Tasklist は正常に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasklist.destroy

    flash[:success] = 'Tasklist は正常に削除されました'
    redirect_to tasks_url
  end
  
private

  def set_tasklist
    @tasklist = Task.find(params[:id])
  end
  
  # Strong Parameter
  def tasklist_params
    params.require(:task).permit(:content, :status)
  end
end