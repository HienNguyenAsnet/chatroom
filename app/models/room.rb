# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  desc       :text
#  user_id    :integer
#  channel    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_rooms_on_user_id  (user_id)
#

class Room < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :name, :desc

  has_many :messages
end
