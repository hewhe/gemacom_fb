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
    end

    def edit
    end

    def update
    end

    private
    def user_params
        params.require(:user).permit(:name, :profile, :image, :password)
    end
end
