chat_group = ChatGroup.find(params[:chat_group_id])
@messages = @chat_group.messages

  json.array @messages do |message|
    json.name                 User.find(message.user_id).name
    json.created_at           message.created_at
    json.body                 message.body
    json.image                message.image
  end
