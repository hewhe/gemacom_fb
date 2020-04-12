class LikesController < ApplicationController
    before_action :authenticate_user, only: [:create, :destroy]
    def create
        like = Like.new(user_id: current_user.id, group_board_id: params[:board_id])
        #binding.pry
        like.save
        redirect_to(group_path(params[:group_id]))
    end

    def destroy
        like = Like.find_by(user_id: current_user.id, group_board_id: params[:board_id])
        like.destroy
        redirect_to(group_path(params[:group_id]))
    end
end
