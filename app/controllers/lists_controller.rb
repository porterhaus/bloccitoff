class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lists = List.all
  end

  def show
    @list = current_user.list
  end

  def mylist
    @mylist = current_user.list
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params.require(:list).permit(:title))
    @list.user_id = current_user.id

    #authorize @topic
    
    if @list.save
     redirect_to @list, notice: "List was saved successfully."
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
