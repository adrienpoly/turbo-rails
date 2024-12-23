class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])

    if (other_id = params[:other_message])
      @other_message = Message.find(other_id)
    end
  end

  def index
    @messages = Message.all
  end

  def section
  end

  def create
    respond_to do |format|
      format.html { redirect_to message_url(id: 1), notice: "Message was successfully created." }
      format.turbo_stream { render turbo_stream: turbo_stream.append(:messages, "message_1"), status: :created }
    end
  end

  def update
    @message = Message.new(id: 1, content: "My message")
  end
end
