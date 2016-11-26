require 'rails_helper'

describe Message do
  describe '#create' do
    it "is invalid without a body" do
      message = build(:message,body: nil)
      message.valid?
      expect(message.errors[:body].any?).to eq(true)
    end
    it "is valid with a body,chat_group_id,user_id,image" do
      message = build(:message)
      expect(message).to be_valid
    end
  end
end
