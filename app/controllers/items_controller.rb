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

  def update
    item = Item.find params[:id]
    item.update item_params
    redirect_to item
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

  def self.search(search)
  where("title ILIKE ? OR address ILIKE ? OR image ILIKE ? OR condition ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

  private

  def item_params
    params.require(:item).permit(:image, :title, :address, :condition)

  end
end
