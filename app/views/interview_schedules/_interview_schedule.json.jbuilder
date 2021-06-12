json.extract! interview_schedule, :id, :interviewer_id, :interviewee_id, :start_time, :end_time, :created_at, :updated_at
json.url interview_schedule_url(interview_schedule, format: :json)
