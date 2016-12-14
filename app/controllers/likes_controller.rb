class LikesController < ApplicationController
  before_action :authenticate_user

  def create 
    idea    = Idea.find params[:idea_id]
    like    = Like.new(user: current_user, idea: idea)

    if cannot? :like, idea
      redirect_to :back, notice: " Cannot like own idea "
    elsif like.save
      redirect_to :back, notice: "✨Thanks for liking✨"
    else
      redirect_to :back, alert: like.errors.full_messages.join(", ")
    end
  end

  def destroy
    like = Like.find params[:id]

    if like.destroy
      redirect_to :back, notice: "😭"
    else
      redirect_to :back, alert: like.errors.full_messages.join(", ")
    end
  end

end
