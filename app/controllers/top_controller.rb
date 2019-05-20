class TopController < ApplicationController
  def show
    @messages = Message.all
    @message = Message.new
    if user_signed_in?
      @user_name = current_user.name
    end
  end
end
