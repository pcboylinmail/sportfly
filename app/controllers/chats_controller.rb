class ChatsController < ApplicationController
	before_action :set_live_show,only:[:show, :like, :unlike]
  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.all
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    # @love = current_user.loves.find_by_chat_id(params[:id])
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    # @live_show = live_show.find(params[:id])
    @user=current_user
    @chat = Chat.new(chat_params)
    @chat.user_id = current_user.id

    # @chat = current_user.chats.new(chat_params)
    @chat.live_show_id = params[:live_show]
    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'chat was successfully created.' }
        format.json { render :show, status: :created, location: @chat }
        format.js {
          ActionCable.server.broadcast("public_room", { :chat => @chat, :user => @user } )
          render :nothing => true
        }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
        format.js{
          # render :text => "alert('請輸入文字！！');"
        }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    puts "you_are_like"
    @like = current_user.likes.build(:chat_id => params[:id])
    @like.save
    respond_to do |format|
      format.html do 
        redirect_to live_show_path(:id => @live_show.id) 
      end
      format.json do
        render :json=> {:message => "ok"}
      end
    end
  end

  def unlike
    puts "you_are_like"
    @like = current_user.likes.find_by_chat_id(params[:id])
    @like.destroy
    respond_to do |format|
      format.html do 
        redirect_to live_show_path(:id => @live_show.id) 
      end
      format.json do
        render :json=> {:message => "ok"}
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_chat
    #   @chat = chat.find(params[:id])
    # end
    def set_live_show
      @live_show = LiveShow.find(params[:live_show_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:content, :user_id, :live_show_id)
    end
end
