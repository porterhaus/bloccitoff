class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lists = List.all
  end

  def show
    @list = current_user.list
    #@items = current_user.list.items
  end

  def mylist
    @mylist = current_user.list
  end

  def new
    @list = List.new
  end

  def edit
    @list = current_user.list
  end

  def create
    @list = List.new(params.require(:list).permit(:title))
    @list.user_id = current_user.id
    
    if @list.save
     redirect_to @list, notice: "List was saved successfully."
    else
     flash[:error] = "Error creating list. Please try again."
     render :new
    end
  end

  def update
    @list = current_user.list
    #authorize @topic
    if @list.update_attributes(params.require(:list).permit(:title))
     redirect_to @list, notice: "List updated successfully."
    else
     flash[:error] = "Error saving changes. Please try again."
     render :edit
    end
  end

  def destroy
     @list = current_user.list

     if @list.destroy
       flash[:notice] = "Your list was deleted successfully."
       redirect_to list_path
     else
       flash[:error] = "There was an error deleting your list."
       render :show
     end
   end

end
