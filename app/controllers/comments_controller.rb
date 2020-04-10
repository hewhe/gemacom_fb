class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.group_board_id = params[:board_id]

        if @comment.save
            flash[:success] = "コメントに成功しました"
            redirect_to(group_board_path(params[:group_id], params[:board_id]))
        else
            @group = Group.find_by(id: params[:group_id])
            @board = GroupBoard.find_by(group_id: @group.id)
            @comments = Comment.where(group_board_id: @board.id)
            render("boards/show")

        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id],)
        comment.destroy
        redirect_to(group_board_path(params[:group_id], params[:board_id]))
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end