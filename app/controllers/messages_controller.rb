class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    current_user.reply_to_conversation(@conversation, params[:mailboxer_message][:body])
    redirect_to conversation_path(@conversation)
  end

  private

    def set_conversation
      @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end
end