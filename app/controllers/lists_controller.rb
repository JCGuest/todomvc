class ListsController < ApplicationController

    def index
        @lists = List.all.reverse
        @list = List.new
    end

    def show 
        @list = List.find(params[:id])
        @item = @list.items.build
    end

    def create 
        @list = List.new(list_params)
        if @list.save
            redirect_to lists_path
        else
            # redirect_to lists_path
            @lists = List.all.reverse
            render :index
        end
    end

    private

    def list_params
        params.require(:list).permit(:name)
    end
end
