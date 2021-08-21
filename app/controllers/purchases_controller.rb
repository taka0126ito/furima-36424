class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :create

   def index
    @purchase_residences =  PurchaseResidence.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
        redirect_to root_path
    end
  end



 

  def create

    @purchase_residences = PurchaseResidence.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_residences.valid?
      pay_item
       @purchase_residences.save
     return redirect_to root_path
    else
       
      render :index
    end
  end




    private

  def purchase_params
    params.require(:purchase_residence).permit(:postal_code, :municipality, :address, :building_name, :phone_number, :shipping_area_id, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
 

  def move_to_index
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchase_params[:token],    
      currency: 'jpy'            
    )
  end

  
end
