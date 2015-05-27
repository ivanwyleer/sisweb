class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user
      if current_user.role_id == 1
        @calendars = current_user.calendars
      else
        @calendars = Calendar.search(params[:search])
      end
    end
    respond_with(@calendars)
  end

  def change_status
    @calendar = Calendar.find(params[:calendar])   
    @calendar.status = params[:new_status]
    @calendar.save
    redirect_to calendars_path
  end


  def show
    respond_with(@calendar)
  end

  def new
    @calendar = Calendar.new
    respond_with(@calendar)
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
	  @calendar.date_send = Time.now
    @calendar.date_marked = Time.now
    @calendar.save
    respond_with(@calendar)
  end

  def update
    @calendar.update(calendar_params)
    respond_with(@calendar)
  end

  def destroy
    @calendar.destroy
    respond_with(@calendar)
  end

  private
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    def calendar_params
      params.require(:calendar).permit(:hair_size, :hair_color, :date_request, :date_marked, :date_send, :observation, :status, :service_id, :professional_id, :user_id)
    end
end
