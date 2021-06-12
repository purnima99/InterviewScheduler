class CreateInterviewSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :interview_schedules do |t|
      t.references :interviewer, null: false, foreign_key: true
      t.references :interviewee, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
