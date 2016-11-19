class Api::ChatsController < Api::ApiController
  before_action :authenticate_user!
  def index
    @live_show = LiveShow.find(params[:live_show_id])
    @chats = @live_show.chats
    render :json => {
      :live_show => @live_show.return_json,
      :chats => @chats.map{|i|i.return_json}
    }

  end

  def latest_chats
    @live_show = LiveShow.find(params[:live_show_id])
    @chats = @live_show.chats.where( " id > ? ", params[:chat_id] )
    render :json =>{
      :chats => @chats
    }
  end

  def create
    @chat = Chat.new(:user_id => current_user.id,
                     :live_show_id => params[:live_show_id],
                     :content => params[:content])
    if @chat.save
      render :json => {
        :status => 200,
        :message => "create succeed",
        :chat => @chat.return_json
      }
    else
      render :json => {
             :status => 401,
             :message => "create failed"
      }
    end
  end

  def destroy
    @live_show = LiveShow.find(params[:live_show_id])
    @chat = @live_show.chats.find(params[:id])
    if @chat.destroy
        render :json => {
        :status => 200,
        :message => "destroy succeed"
      }
    else
      render :json => {
        :status => 401,
        :message => "destroy failed"
      }
    end
  end

end
