class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

def show
 
end



def new
  @item = Item.new
end

def edit
  redirect_to root_path unless current_user.id == @item.user_id
  
end

 def update
 
 redirect_to root_path unless current_user.id == @item.user_id
 if @item.update(item_params)
  redirect_to item_path 
 else
  render :"items/edit"
 end
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :"items/new"
  end
end

 private

 

 def item_params
  params.require(:item).permit(:name, :image, :price, :explanation, :condition_id, :category_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:id])
end

end

