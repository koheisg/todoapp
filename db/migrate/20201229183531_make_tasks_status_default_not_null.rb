class MakeTasksStatusDefaultNotNull < ActiveRecord::Migration[6.1]
  class Task < ActiveRecord::Base
    self.table_name = 'tasks'
  end

  def up
    change_column_default(:tasks, :status, from: nil, to: 0)
    Task.update_all(status: 0)
    change_column_null(:tasks, :status, false)
  end

  def down
    change_column_default(:tasks, :status, from: 0, to: nil)
  end
end
