class ChangeColumnname < ActiveRecord::Migration[6.1]
  def change
    rename_column :interview_schedules, :Start_Time, :start_time
    rename_column :interview_schedules, :End_Time, :end_time
    #rename_column :interview_schedules, :Resume, :resume
  end
end
