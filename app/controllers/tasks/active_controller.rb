class Tasks::ActiveController < ApplicationController
  def index
    @tasks = Task.active.order(created_at: :desc)
  end
end
