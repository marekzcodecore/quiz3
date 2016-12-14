class MembersController < ApplicationController
  before_action :authenticate_user

  def create 
    idea 	= Idea.find params[:idea_id]
    member  = Member.new(user: current_user, idea: idea)

    if cannot? :member, idea
      redirect_to :back, notice: " Cannot join as member for own idea "
    elsif member.save
      redirect_to :back, notice: "✨Thanks for joining as member of idea✨"
    else
      redirect_to :back, alert: member.errors.full_messages.join(", ")
    end
  end

  def destroy
    member = Member.find params[:id]

    if member.destroy
      redirect_to :back, notice: "😭"
    else
      redirect_to :back, alert: member.errors.full_messages.join(", ")
    end
  end

end

