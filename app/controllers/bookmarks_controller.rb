class BookmarksController < ApplicationController
    before_action :authenticate_user, only: [:create, :update]
    def create
        bookmark = Bookmark.new(user_id: current_user.id, group_board_id: params[:board_id])
        bookmark.save
        redirect_to(group_path(params[:group_id]))
    end

    def destroy
        bookmark = Bookmark.find_by(user_id: current_user.id, group_board_id: params[:board_id])
        bookmark.destroy
        redirect_to(group_path(params[:group_id]))
    end
end
