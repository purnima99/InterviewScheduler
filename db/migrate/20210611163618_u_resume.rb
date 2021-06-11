class UResume < ActiveRecord::Migration[6.1]
  def up
    change_table :interview_schedules do |t|
      t.string :resume
    end
  end
end
