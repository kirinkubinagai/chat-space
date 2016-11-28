require 'rails_helper'
describe MessagesController, type: :controller do
  let(:user){create(:user)}
  let(:chat_group){create(:chat_group)}
  let(:message){create(:message,chat_group_id: user.chat_groups.ids,user_id: user.id)}
  let(:users_group){{user_id: user.id,chat_group_id: chat_group.id}}

  before do
    login_user(user)
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new, chat_group_id: chat_group.id
      expect(response).to render_template :new
    end
  end

  describe "GET #create" do
    it "save success" do
      expect {
        post :create, message: attributes_for(:message),chat_group_id: chat_group.id
      }.to change(Message, :count).by(1)
    end
  end

  describe "GET #create" do
    it "save not success when body is nil" do
      message = build(:message,body: nil)
      message.valid?
      post :create, message:attributes_for(:message),chat_group_id: chat_group.id
      expect(message.errors[:body].any?).to eq(true)
    end
  end
end
