class IdeasController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]
  before_action :find_idea, only: [:edit, :update, :destroy, :show]

  before_action :authorize_access, only: [:edit, :update, :destroy]




  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      flash[:notice] = 'Idea made!'
      redirect_to idea_path(@idea)
    else
      flash.now[:alert] = 'Please see errors below'
      render :new
    end
  end

  def index
    @ideas = Idea.order(created_at: :desc)
      
  end

  def show
   @comment = Comment.new
 #  @comment = @idea.comment_for(current_user) 
   @idea = Idea.find params[:id]
   @like = @idea.like_for(current_user)
   @member = @idea.member_for(current_user)
  end

  private

  def idea_params
    params.require(:idea).permit([:title, :body, member_ids: [], like_ids: []])
  end

  def find_idea
    @idea = Idea.find params[:id]
  end

  def authorize_access
    unless can? :manage, @idea
      # head :unauthorized # this will send an empty HTTP response with 401 code
      redirect_to root_path, alert: 'access denied'
    end
  end

end
