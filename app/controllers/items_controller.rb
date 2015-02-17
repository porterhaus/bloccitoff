class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params.require(:item).permit(:description, :completed))
    #authorize @topic
    if @item.save
     redirect_to @item, notice: "Item was saved successfully."
    else
     flash[:error] = "Error creating item. Please try again."
     render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    #authorize @topic
    if @item.update_attributes(params.require(:item).permit(:description, :completed))
     redirect_to @item, notice: "Item updated successfully."
    else
     flash[:error] = "Error saving item. Please try again."
     render :edit
    end
  end

end
