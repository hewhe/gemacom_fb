class BoardsController < ApplicationController
    def new
        @board = GroupBoard.new
    end

    def create
        @board = GroupBoard.new(board_params)
        @board.user_id = current_user.id
        @board.group_id = params[:group_id]
        @board.flag = params[:group_board][:flag]
        #@board.flag = "雑談"
        if @board.save
            flash[:notice] = "投稿に成功しました"
            redirect_to("/groups/#{params[:group_id]}")
        else
            render(:new)
        end
    end

    def edit
        @board = GroupBoard.find_by(id: params[:id])
    end

    def update
        @board = GroupBoard.find_by(id: params[:id])
        if @board.update(board_params)
            flash[:notice] = "投稿を編集しました"
            redirect_to("/groups/#{params[:group_id]}")
        else
            render(:edit)
        end
    end

    def destroy
        board = GroupBoard.find_by(id: params[:id])
        board.destroy
    end

    private
    def board_params
        params.require(:group_board).permit(:content)
    end
end
