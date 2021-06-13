class InterviewSchedulesController < ApplicationController
  before_action :set_interview_schedule, only: %i[ edit update destroy ]

  # GET /interview_schedules or /interview_schedules.json
  def index
    @interview_schedules = InterviewSchedule.all
  end

  # GET /interview_schedules/1 or /interview_schedules/1.json
  def show
    # puts "checkpoint1"
    # email = params[:id] +"."+ params[:format]
    # vr = Interviewee.where("email_id=?",email)
    # puts vr
    # puts "checkpint2"
    @interview_schedule = InterviewSchedule.find(params[:id])

    #params.require(:interview_schedule).permit(:interviewer_id, :interviewee_id, :start_time, :end_time, :resume)
  end

  # GET /interview_schedules/new
  def new
    @interview_schedule = InterviewSchedule.new
  end

  # GET /interview_schedules/1/edit
  def edit
  end

  # POST /interview_schedules or /interview_schedules.json
  def create
    respond_to do |format|
      passed_time = DateTime.new(interview_schedule_params['start_time(1i)'].to_i,
                                  interview_schedule_params['start_time(2i)'].to_i,
                                  interview_schedule_params['start_time(3i)'].to_i,
                                  interview_schedule_params['start_time(4i)'].to_i,
                                  interview_schedule_params['start_time(5i)'].to_i)

      passed_end_time = DateTime.new(interview_schedule_params['end_time(1i)'].to_i,
                                  interview_schedule_params['end_time(2i)'].to_i,
                                  interview_schedule_params['end_time(3i)'].to_i,
                                  interview_schedule_params['end_time(4i)'].to_i,
                                  interview_schedule_params['end_time(5i)'].to_i)                            

      doesInterviewExist = InterviewSchedule.where("(interviewer_id = ? OR interviewee_id= ?)  AND ((interview_schedules.start_time <= ? AND interview_schedules.end_time >= ?) OR (? <= interview_schedules.start_time AND ? >= interview_schedules.end_time))",interview_schedule_params[:interviewer_id], interview_schedule_params[:interviewee_id], passed_time,passed_time,passed_time,passed_end_time).present?
      
      #current_time = DateTime.now()

        
      # check if user already has a interview or not
      if doesInterviewExist || passed_time < DateTime.now() || passed_end_time < DateTime.now()
        @interview_schedule = InterviewSchedule.new()
        @interview_schedule.errors[:base] << "Interviewer and/or Interviewee is busy"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }

      else
        # upload image
        uploaded_io = interview_schedule_params[:resume]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        new_params = interview_schedule_params.clone 
        new_params[:resume] = uploaded_io.original_filename
        # upload image

        # save data
        @interview_schedule = InterviewSchedule.new(new_params)
        if @interview_schedule.save 
          # UserMailer.interview_confirmation(Interviewee.find(@interview_schedule.interviewee_id)).deliver
          format.html { redirect_to @interview_schedule, notice: "Interview schedule was successfully created." }
          format.json { render :show, status: :created, location: @interview_schedule }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }
        end
        # save data
      end

    end
  end

  # PATCH/PUT /interview_schedules/1 or /interview_schedules/1.json
  def update
    respond_to do |format|
      passed_time = DateTime.new(interview_schedule_params['start_time(1i)'].to_i,
                                  interview_schedule_params['start_time(2i)'].to_i,
                                  interview_schedule_params['start_time(3i)'].to_i,
                                  interview_schedule_params['start_time(4i)'].to_i,
                                  interview_schedule_params['start_time(5i)'].to_i)
      passed_end_time = DateTime.new(interview_schedule_params['end_time(1i)'].to_i,
                                  interview_schedule_params['end_time(2i)'].to_i,
                                  interview_schedule_params['end_time(3i)'].to_i,
                                  interview_schedule_params['end_time(4i)'].to_i,
                                  interview_schedule_params['end_time(5i)'].to_i) 

      doesInterviewExist = InterviewSchedule.where("(interviewer_id = ? OR interviewee_id= ?) AND id !=? AND ((interview_schedules.start_time <= ? AND interview_schedules.end_time >= ?) OR (? <= interview_schedules.start_time AND ? >= interview_schedules.end_time))",
                                                    interview_schedule_params[:interviewer_id], interview_schedule_params[:interviewee_id],params[:id], passed_time,passed_time,passed_time,passed_end_time).present?

      # check if user already have a interview or not
      if doesInterviewExist
        @interview_schedule.errors[:base] << "Interviewer and/or Interviewee is busy"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }

      else
        # upload image
        uploaded_io = interview_schedule_params[:resume]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        new_params = interview_schedule_params.clone 
        new_params[:resume] = uploaded_io.original_filename
        # upload image

        # save data
        if @interview_schedule.update(new_params)
        # if true
          format.html { redirect_to @interview_schedule, notice: "Interview schedule was successfully updated." }
          format.json { render :show, status: :ok, location: @interview_schedule }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }
        end
        # save data
      end
    end
  end

  # DELETE /interview_schedules/1 or /interview_schedules/1.json
  def destroy
    @interview_schedule.destroy
    respond_to do |format|
      format.html { redirect_to interview_schedules_url, notice: "Interview schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_schedule
      @interview_schedule = InterviewSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interview_schedule_params
      params.require(:interview_schedule).permit(:interviewer_id, :interviewee_id, :start_time, :end_time, :resume)
    end
end
