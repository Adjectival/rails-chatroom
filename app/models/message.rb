class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  def timestamp
    created_at.strftime('%H:%M:%S %B %d %Y')
  end
end
