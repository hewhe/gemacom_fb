class JoinsController < ApplicationController
    def create
        member = Member.new(user_id: current_user.id, group_id: params[:group_id], flag: "guest")
        member.save
        redirect_to("/groups/#{params[:group_id]}")
    end

    def destroy
        member = Member.find_by(user_id: current_user.id, group_id: params[:group_id])
        member.destroy
        redirect_to("/groups/#{params[:group_id]}")
    end
end
