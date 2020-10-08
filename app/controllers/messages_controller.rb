class MessagesController < ApplicationController

  def create
    @message = Message.create(message_params)
    if @message.save
      redirect_to item_path(@message.item_id)
    else
      redirect_to item_path(@message.item_id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id:current_user.id, item_id: params[:item_id])
  end

end