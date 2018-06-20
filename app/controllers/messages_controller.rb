class MessagesController < ApplicationController

  def create
    message = current_user.messages.new(message_params)

    if message.save
      redirect_to user_url(id: current_user.id)
    else
      # shit something went wrong
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
