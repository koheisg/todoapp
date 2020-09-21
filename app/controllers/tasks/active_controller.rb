class Tasks::ActiveController < ApplicationController
  include Secured
  def index
    @tasks = Task.where(user_id: @user[:uid]).active.order(created_at: :desc).page(params[:page])
    render 'tasks/index'
  end
end
