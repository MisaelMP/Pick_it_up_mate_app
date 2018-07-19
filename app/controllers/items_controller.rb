class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = if params[:search]
               Item.search(params[:search]).order('created_at DESC')
             else
               Item.all.order('created_at DESC')
            end
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
    if params['item']['image']
      cloudinary = Cloudinary::Uploader.upload(params['item']['image'])
      item.image = cloudinary['url']
      item.save
    end
    redirect_to item
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new item_params
    if params['item']['image']
      cloudinary = Cloudinary::Uploader.upload(params['item']['image'])
      item.image = cloudinary['url']
    end
    item.save
    redirect_to item
  end

  def destroy
    item = Item.find params[:id]
    item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :address, :condition)
  end
end
