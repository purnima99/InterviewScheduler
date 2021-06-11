class InterviewSchedulesController < ApplicationController
  before_action :set_interview_schedule, only: %i[ show edit update destroy ]

  # GET /interview_schedules or /interview_schedules.json
  def index
    @interview_schedules = InterviewSchedule.all
  end

  # GET /interview_schedules/1 or /interview_schedules/1.json
  def show
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
      # check if user already has a interview or not
      # doesInterviewExist = InterviewSchedule.where(:start_time => (Start_time)..End_time).present?
      # doesInterviewExist = InterviewSchedule.where("Start_Time <= ? AND End_Time >= ?", interview_schedule_params[:Start_Time],interview_schedule_params[:Start_Time]).present?
      # return
      # doesInterviewExist = InterviewSchedule.where("interviewer_id = ?",interview_schedule_params[:interviewer_id]).present?
      # check if user already have a interview or not
      if false
        
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: {"message":"interviwer busy"}, status: :unprocessable_entity }

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
      if @interview_schedule.update(interview_schedule_params)
        format.html { redirect_to @interview_schedule, notice: "Interview schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @interview_schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }
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
      params.require(:interview_schedule).permit(:interviewer_id, :interviewee_id, :Start_Time, :End_Time, :resume)
    end
end
