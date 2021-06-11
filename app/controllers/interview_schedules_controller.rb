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
    @interview_schedule = InterviewSchedule.new(interview_schedule_params)

    respond_to do |format|
      if @interview_schedule.save
        format.html { redirect_to @interview_schedule, notice: "Interview schedule was successfully created." }
        format.json { render :show, status: :created, location: @interview_schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview_schedule.errors, status: :unprocessable_entity }
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
      params.require(:interview_schedule).permit(:interviewer_id, :interviewee_id, :Start_Time, :End_Time)
    end
end
