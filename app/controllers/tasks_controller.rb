class TasksController < ApplicationController
  include Secured
  before_action :set_task, only: [:update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.where(user_id: @user[:uid]).order(created_at: :desc).page(params[:page])
  end

  # POST /tasks
  def create
    @task = Task.new(task_params.merge(user_id: @user[:uid]))

    respond_to do |format|
      if @task.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend(:tasks, @task) }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:form, partial: "tasks/form", locals: { task: @task })
        end
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    respond_to do |format|
      @task.update(task_params.merge(user_id: @user[:uid]))
      format.turbo_stream { render turbo_stream: turbo_stream.replace("task_#{@task.id}", @task) }
    end
  end

  # DELETE /tasks/1.js
  def destroy
    @task.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("task_#{@task.id}") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.where(user_id: @user[:uid]).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:content, :status)
    end
end
