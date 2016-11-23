class ChatGroup < ApplicationRecord
  has_many :users_groups
  has_many :users,through: :users_groups
  has_many :messages
  accepts_nested_attributes_for :users
end
