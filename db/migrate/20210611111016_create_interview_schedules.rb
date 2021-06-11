class CreateInterviewSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :interview_schedules do |t|
      t.references :interviewer, null: false, foreign_key: true
      t.references :interviewee, null: false, foreign_key: true
      t.datetime :Start_Time
      t.datetime :End_Time

      t.timestamps
    end
  end
end
