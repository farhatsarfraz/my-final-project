class CommentsController < ApplicationController
    before_action :require_user
    def create 
        @bus = Bus.find(params[:bus_id])
        @comment = @bus.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save
         ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
            #flash[:success] = "successfully saved"
            #redirect_to bus_path(@bus)
        else
            flash[:danger] = "comment not created"
            redirect_back fallback_location: root_path 
        end
    end
    def index
        @comments = Comment.all
    end
    def show
        @comments = Comment.find(params[:id])
    end
private
    def comment_params
        params.require(:comment).permit(:description)
    end
end