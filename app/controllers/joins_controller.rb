class JoinsController < ApplicationController
    def create
        member = Member.new(user_id: current_user.id, group_id: params[:group_id], flag: "guest")
        member.save
        redirect_to("/groups/#{params[:group_id]}")
    end

    def destroy
        if params[:flag]
            #管理者が参加者を追放
            member = Member.find_by(user_id: params[:member_id], group_id: params[:group_id])
            member.destroy
            redirect_to("/groups/#{params[:group_id]}")
        else
            #自分で退会
            member = Member.find_by(user_id: current_user.id, group_id: params[:group_id])
            member.destroy
            redirect_to("/groups/#{params[:group_id]}")
        end
    end
end
