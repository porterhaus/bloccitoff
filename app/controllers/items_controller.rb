class ItemsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js
  
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

  def destroy
    @list = current_user.list
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Todo completed!"
    else
      flash[:error] = "Todo could not be completed. Try again."
    end

    respond_with(@litem) do |format|
     format.html { redirect_to [@list, @item] }
    end

  end

  private

  def post_params
    params.require(:item).permit(:name, :list_id)
  end

end
