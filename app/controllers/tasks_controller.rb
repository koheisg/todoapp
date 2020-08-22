class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.order(created_at: :desc)
  end

  # POST /tasks.js
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.js { render :create, status: :created }
      else
        format.js { render :error, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1.js
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js { render :update }
      else
        format.js { render :error, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1.js
  def destroy
    @task.destroy
    respond_to do |format|
      format.js { render :destroy }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:content, :status)
    end
end
