class PrivateChatsController < ApplicationController
  def show
    if PrivateChat.find_by(id: params[:id]).present?
      @private_chat = PrivateChat.find(params[:id])
      if @private_chat.user_1_id == current_user.id
        @user_name = User.find(@private_chat.user_2_id).name
      elsif @private_chat.user_2_id == current_user.id
        @user_name = User.find(@private_chat.user_1_id).name
      end
      @messages = Message.where(private_chat_id: params[:id])
    else
      redirect_to users_path
    end
  end

  def create
    a = PrivateChat.find_by(user_1_id: params[:user_1_id], user_2_id: params[:user_2_id])
    b = PrivateChat.find_by(user_2_id: params[:user_1_id], user_1_id: params[:user_2_id])
    if a.present?
      redirect_to action: 'show', id: a.id
    elsif b.present?
      redirect_to action: 'show', id: b.id
    else
      @private_chat = PrivateChat.new
      @private_chat.user_1_id = params[:user_1_id]
      @private_chat.user_2_id = params[:user_2_id]
      if @private_chat.save
        redirect_to action: 'show', id: @private_chat.id
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end
end
