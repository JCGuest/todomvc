class ItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    if @item.save 
      redirect_to list_path(@list)
    else
      render 'lists/show'
      # redirect_to list_path(@list)
    end
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end
end
