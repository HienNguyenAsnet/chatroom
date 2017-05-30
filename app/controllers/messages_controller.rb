class MessagesController < ApplicationController
  def create
    Message.create message_params.merge user: current_user
  end

  private

  def message_params
    params.require(:message).permit(:text, :room_id)
  end
end
