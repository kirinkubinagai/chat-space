class ChatGroup < ApplicationRecord
  has_many :users
  accepted_nested_attributes_for :users
end
