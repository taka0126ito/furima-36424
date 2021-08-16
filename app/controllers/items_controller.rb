class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

def show
end

def new
  #@item = Item.new
end

def edit

end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end

 private

 def item_params
  params.require(:item).permit(:title,:text,:category_id)
 end

end
