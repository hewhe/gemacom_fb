class BoardsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
    #before_action :correct_user, only: [:edit, :update, :destroy]

    def new
        #グループ内投稿の新規作成フォーム（コメントではない）
        @board = GroupBoard.new
    end

    def create
        #viewでinteger型で設定してもparamsはstringで送られてくるからenumはinteger型で保存する
        params[:group_board][:flag] = params[:group_board][:flag].to_i

        #if Member.find_by(group_id: params[:group_id], user_id: current_user.id).present?これでこのグループに所属していないユーザは作成できない？
        @board = GroupBoard.new(board_params)
        @board.user_id = current_user.id
        @board.group_id = params[:group_id]
        #@board.flag = params[:group_board][:flag]
        #@board.flag = "雑談"
        if @board.save
            flash[:success] = "投稿に成功しました"
            redirect_to(group_path(params[:group_id]))
        else
            render(:new)
        end
    end

    def show
        #グループ内投稿の詳細画面
        @group = Group.find_by(id: params[:group_id])
        @board = GroupBoard.find_by(id: params[:id], group_id: @group.id)
        @comments = Comment.where(group_board_id: @board.id)
        @comment = Comment.new
        #binding.pry
    end

    def edit
        @board = GroupBoard.find_by(id: params[:id])
        member = Member.find_by(group_id: params[:group_id], flag: "admin")
        if current_user.id == @board.user.id or current_user.id == member.user_id
            @group = Group.find_by(id: params[:group_id])
            #@board = GroupBoard.find_by(id: params[:id])
        else
            redirect_to(root_path)
        end
    end

    def update
        params[:group_board][:flag] = params[:group_board][:flag].to_i

        @board = GroupBoard.find_by(id: params[:id])
        if @board.update(board_params)
            flash[:success] = "投稿を編集しました"
            redirect_to("/groups/#{params[:group_id]}/boards/#{params[:id]}")
        else
            render(:edit)
        end
    end

    def destroy
        board = GroupBoard.find_by(id: params[:id])
        #binding.pry
        board.destroy
        redirect_to("/groups/#{params[:group_id]}")
    end

    private
    def board_params
        params.require(:group_board).permit(:content, :flag)
    end

    #今回は使わないかも
    def correct_user
        board = GroupBoard.find_by(id: params[:id])
        member = Member.find_by(group_id: params[:group_id], flag: "admin")
        if current_user.id != board.user.id or current_user.id != member.user_id
            redirect_to(root_path)
        end
    end
end
