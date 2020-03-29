class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "ログインしました"
            redirect_to(root_path)
        else
            flash.now[:notice] = "名前またはパスワードが間違いです"
            @name = params[:session][:name]
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to(root_path)
    end
end