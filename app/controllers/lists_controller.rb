class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
