class AttendancesController < ApplicationController
  before_action :set_event
  before_action :authenticate_user!
  before_action :verify_not_event_creator

  def create
    if Attendance.where(attended_event_id: params[:event_id]).where(attendee_id: current_user.id).exists?
      @attendance = Attendance.find_by(attended_event_id: params[:event_id], attendee_id: current_user.id)
      redirect_to event_path(@event), notice: "You are already attending this event!"
    else
      @attendance = Attendance.new ({ attended_event_id: params[:event_id], attendee_id: current_user.id })
      if @attendance.save
        redirect_to event_path(@event), notice: "You are attending this event!"
      else
        render "events/show", status: :unprocessable_entity
      end
    end
  end

  def destroy
    @attendance = Attendance.find(params.expect(:id))
    @attendance.destroy!
    redirect_to event_path(@event), notice: "You are not attending this event!"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params.expect(:event_id))
    end

    # verify user is not the event creator
    def verify_not_event_creator
      if @event.creator_id == current_user.id
        redirect_to event_path(@event), alert: "You are a creator for this event!"
      end
    end
end
