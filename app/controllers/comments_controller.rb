class CommentsController < ApplicationController

 before_action :authenticate_user

   def create
   	 @idea    = Idea.find params[:idea_id]
     @comment = Comment.new(user: current_user, idea: @idea)
     @comment.user = current_user
     if @comment.save
       flash[:notice] = 'Comment made!'
       redirect_to comment_path(@comment)
     else
       flash.now[:alert] = 'Please see errors below'
       render :new
     end
   end


end
