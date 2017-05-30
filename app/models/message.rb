# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  room_id    :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_save :broadcast_message

  private

  def broadcast_message
    data = {
      author: user.email,
      text: text
    }

    ActionCable.server.broadcast("chat_#{room.id}", data)
  end
end
