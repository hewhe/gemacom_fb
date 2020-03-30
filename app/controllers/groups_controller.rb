class GroupsController < ApplicationController
    def top
        #groupの一覧表示画面
        @groups = Group.all
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(groupe_params)
        if @group.save
            Member.create(user_id: current_user.id, group_id: @group.id, flag: "admin")
            flash[:notice] = "グループを作成しました"
            redirect_to("/groups/new")
        else
            render(:new)
        end
    end

    def index
    end

    def show
    end

    def info
    end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        @group = Group.find(params[:id])
        if @group.uodate(groupe_params)
            flash[:notice] = "グループを編集しました"
            redirect_to("/groups/new")
        else
            render(:edit)
        end
    end

    private
    def groupe_params
        params.require(:group).permit(:name, :profile, :group_category_id, :image)
    end
end
