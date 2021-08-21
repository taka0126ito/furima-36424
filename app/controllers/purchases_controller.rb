class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

   def index
    @purchase_residences =  PurchaseResidence.new
   
  end



 

  def create

    @purchase_residences = PurchaseResidence.new(purchase_params)
    
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
    params.require(:purchase_residence).permit(:postal_code, :municipality, :address, :building_name, :phone_number, :shipping_area_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
 

  def move_to_index
    if @item.user_id == current_user.id
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
 def set_item
  @item = Item.find(params[:item_id])
 end
  
end
