class RoomsController < ApplicationController
  def new
    @room ||= Room.new
  end

  def create
    room = Room.new room_params.merge user: current_user

    if room.save
      redirect_to :root
    else
      flash.alert = room.errors.full_messages
      render :new
    end
  end

  def show
    @room = Room.find params[:id]
    @message = Message.new
  end

  private

  def room_params
    params.require(:room).permit(:name, :desc)
  end
end
