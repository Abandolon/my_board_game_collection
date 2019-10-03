class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
    # raise
  end

  def new
    @recipients = Profile.all - [Profile.find_by(user: current_user)]
  end

  def create
    recipient = User.find(params[:user_id])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end
end
