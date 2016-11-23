class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_group
  validates :body, presence: true
end
