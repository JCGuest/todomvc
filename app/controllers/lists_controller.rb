class ListsController < ApplicationController
before_action :auth_required
before_action :set_user
    def index
        @lists = @user.lists.all.reverse
        @list = @user.lists.build
    end

    def show 
        @list = List.find(params[:id])
        @item = @list.items.build
    end

    def create 
        @list = @user.lists.build(list_params)
        if @list.save
            redirect_to lists_path
        else
            @lists = @user.lists.all.reverse
            render :index
        end
    end

    private

    def set_user
        @user = User.find_by(id: session[:user_id])
    end

    def list_params
        params.require(:list).permit(:name)
    end
end
