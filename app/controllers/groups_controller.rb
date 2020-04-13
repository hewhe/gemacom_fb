class GroupsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :edit, :update]
    before_action :correct_user, only: [:edit, :update]
    def top
        @group_categories = GroupCategory.all

        #カテゴリー検索
        if params[:group_category_id].present?
            @groups = Group.where(group_category_id: params[:group_category_id].to_i)
        else
            #groupの一覧表示画面
            @groups = Group.all
        end

        #キーワード検索
        if params[:search].present?
            @groups = Group.where("name like ? or profile like ?", "%#{params[:search][:word]}%", "%#{params[:search][:word]}%")
        end
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(groupe_params)
        if @group.save
            Member.create(user_id: current_user.id, group_id: @group.id, flag: "admin")
            flash[:success] = "グループを作成しました"
            redirect_to("/groups/top")
        else
            render(:new)
        end
    end

    def member
        # p current_userターミナルに出る
        @group = Group.find(params[:id])
        @members = Member.where(group_id: @group.id)
    end

    def show
        @group = Group.find(params[:id])
        #@boards = GroupBoard.where(group_id: group.id)
        # binding.pry
        if params[:type].present?
            case params[:type].to_i
            when 0
                @boards = GroupBoard.where(group_id: @group.id, flag: 0).order(id: "DESC")
            when 1
                @boards = GroupBoard.where(group_id: @group.id, flag: 1).order(id: "DESC")
            when 2
                @boards = GroupBoard.where(group_id: @group.id, flag: 2).order(id: "DESC")
            end
        else
            @boards = GroupBoard.where(group_id: @group.id, flag: 0).order(id: "DESC")
        end
    end

    # def info
    #     group = Group.find(params[:id])
    # end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        @group = Group.find(params[:id])
        if @group.update(groupe_params)
            flash[:success] = "グループを編集しました"
            redirect_to("/groups/#{@group.id}")
        else
            render(:edit)
        end
    end

    private
    def groupe_params
        params.require(:group).permit(:name, :profile, :group_category_id, :image)
    end

    def correct_user
        group = Group.find_by(id: params[:id])
        member = Member.find_by(group_id: group.id, flag: "admin")
        if current_user.id != member.user_id
            redirect_to(root_path)
        end
    end
end
