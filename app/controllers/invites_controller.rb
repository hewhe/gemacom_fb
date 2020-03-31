class InvitesController < ApplicationController
    def index
        #カテゴリー検索の実装
        @invite_categories = InviteCategory.all
        if params[:invite_category_id].present?
            invite_category = InviteCategory.find(params[:invite_category_id].to_i)
            @invites = invite_category.invites
            # binding.pry
            # @invites = Invite.where(invite_category_id: invite_category.id)
        else
            # p 2222
            @invites = Invite.all
        end

        #キーワード検索の実装
        if params[:search].present?#ここをparams[:search][:word]にするとnilClassになるので注意searchがないとwordもないから
            # p 3333
            @invites = Invite.where("title like ? or content like ?", "%#{params[:search][:word]}%", "%#{params[:search][:word]}%")
        end
        #elseでallで取得しなくて良いのはseachもinvite_category_idがなくてもどちらにしろ上のelseが呼ばれてallが取得される、逆にそうしないとカテゴリ検索がキーワード検索に上書きされてしまう
    end

    def new
        @invite = Invite.new
        @invite_categories = InviteCategory.all
        #binding.pry
    end

    def create
        #binding.pry
        @invite = Invite.new(invite_params)
        if @invite.save
            flash[:notice] = "投稿に成功しました"
            redirect_to(invites_path)
        else
            render(:new)
        end
    end

    # def search
    #     #キーワード検索の実装
    #     if params[:search][:word]
    #         @invites = Invite.where("title like ?", "%#{params[:search][:word]}%")
    #     else
    #         @invites = Invite.all
    #     end
    # end

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
