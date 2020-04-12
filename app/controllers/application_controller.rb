class ApplicationController < ActionController::Base
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

    #ユーザとログインしているユーザが一致している時true
    # def current_user?(user)
    #     user == current_user
    # end

    #ログインしている時はtrueを返す（何もない(nil)の否定だから）
	# def logged_in?
	# 	!current_user.nil?
    # end

	def authenticate_user
		if current_user == nil
			flash[:danger] = "ログインしてください"
			redirect_to "/login"
		end
	end

    def forbid_login_user
        if current_user
            flash[:danger] = "既にログインしています"
            redirect_to(root_path)
        end
    end
end
