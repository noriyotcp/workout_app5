class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.messages.build(message_params)
    @message.room = current_user.room

    if @message.save
      ActionCable.server.broadcast "messages_room_#{current_room.id}",
                    render(partial: 'shared/message', object: @message)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
