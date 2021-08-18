class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

def show
 
end



def new
  @item = Item.new
end

def edit
  
  
end

 def update
 

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
def move_to_index
  unless @item.user_id == current_user.id
    redirect_to action: :index
  end
end
end

