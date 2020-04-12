class SessionsController < ApplicationController
    before_action :authenticate_user, only: [:destroy]
    def new
    end

    def create
        user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "ログインしました"
            redirect_to(root_path)
        else
            flash.now[:danger] = "名前またはパスワードが間違いです"
            @name = params[:session][:name]
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "ログアウトしました"
        redirect_to(root_path)
    end
end