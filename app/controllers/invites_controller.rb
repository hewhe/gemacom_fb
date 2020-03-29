class InvitesController < ApplicationController
    def index
        @invites = Invite.all
    end

    def new
        @invite = Invite.new
        @invite_categories = InviteCategory.all
    end

    def create
        @invite = Invite.new(invite_params)
        if @invite.save
            flash[:notice] = "投稿に成功しました"
            redirect_to(invites_path)
        else
            render(:new)
        end
    end

    #機能制限ができないから実装できないかもしれない
    # def edit
    # end

    # def update
    # end

    # def destroy
    # end

    private
    def invite_params
        params.require(:invite).permit(:title, :content, :invite_category_id)
    end
end
