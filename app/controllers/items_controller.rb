class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  def index
    @items = Item.all
  end

def show
end

def new
  @item = Item.new
end

def edit

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

 def move_to_signed_in
  unless user_signed_in?
    redirect_to user_session_path
  end
end

 def item_params
  params.require(:item).permit(:name, :image, :price, :explanation, :condition_id, :category_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
 end

end

