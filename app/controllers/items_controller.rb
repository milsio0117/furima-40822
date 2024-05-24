class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params,only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = @item.user
  end

  def edit
    return if @item.user_id == current_user.id

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to edit_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :postage_payer_id, :prefecture_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end
end
