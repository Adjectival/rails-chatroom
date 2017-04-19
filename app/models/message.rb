class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  def timestamp
    created_at.strftime('%H:%M:%S %B %d %Y')
  end
end
