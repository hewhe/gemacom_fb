class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show, :edit, :update]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.image_id = "112690.jpg"
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "登録に成功しました"
            redirect_to(root_path)
        else
            render(:new)
        end
    end

    def show
        @user = User.find(params[:id])

        if params[:type].present?
            case params[:type].to_i
            when 0
                @members = Member.where(user_id: @user.id).order(id: "DESC")
            when 1
                #binding.pry
                @bookmarks = Bookmark.where(user_id: @user.id).order(id: "DESC")
            end
        else
            @members = Member.where(user_id: @user.id).order(id: "DESC")
        end

    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if params[:image].present?
            #binding.pry
            #image = params[:image]
            @user.image_id = "#{@user.id}.jpg" #jpgにしてる
            File.binwrite("public/#{@user.image_id}", "#{params[:image]}".read)
        end

        if @user.update(user_params)
            flash[:success] = "更新しました"
            redirect_to(user_path(params[:id]))
        else
            render("/users/#{params[:id]}/edit")
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :profile, :image, :password)
    end
end
