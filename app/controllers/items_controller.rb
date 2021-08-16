class ItemsController < ApplicationController
def index
end

def show
end

def new
end

def edit

end

private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
