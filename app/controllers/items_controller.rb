class ItemsController < ApplicationController

  def new
    @list = current_user.list
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = current_user.list.items.build(post_params)
    @item.list = @list

    if @item.save
      flash[:notice] = "Item was added to list."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the item to the list. Please try again."
      render :new
    end
  end

  private

  def post_params
    params.require(:item).permit(:name, :list_id)
  end

end
