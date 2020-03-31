class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        #@user.image_name = "d_image.jpg" 画像の保存
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "登録！！"
            redirect_to(root_path)
        else
            render(:new)
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "更新"
            redirect_to(user_path(params[:id]))
        else
            render(:edit)
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :profile, :image, :password)
    end
end
