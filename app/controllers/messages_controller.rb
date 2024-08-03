class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def receive
    # ignore incoming messages
    head :ok
  end
end
