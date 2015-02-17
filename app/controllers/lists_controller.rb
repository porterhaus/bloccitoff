class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params.require(:list).permit(:title, :permissions))
    #authorize @topic
    if @list.save
     redirect_to @list, notice: "Topic was saved successfully."
    else
     flash[:error] = "Error creating list. Please try again."
     render :new
    end
  end

  def update
    @list = List.find(params[:id])
    #authorize @topic
    if @list.update_attributes(params.require(:list).permit(:title, :permissions))
     redirect_to @list, notice: "List updated successfully."
    else
     flash[:error] = "Error saving topic. Please try again."
     render :edit
    end
  end

end
