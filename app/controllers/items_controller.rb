class ItemsController < ApplicationController
  def index
   @items = Item.all
 end

  def show
 @item = Item.find params[:id]
  end

  def edit
  @item = Item.find params[:id]
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create item_params
    redirect_to item
  end

  def destroy
    item = Item.find params[:id]
      item.destroy
      redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :location, :condition)

  end
end
