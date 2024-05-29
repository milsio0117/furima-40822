class OrdersController < ApplicationController
    before_action :find_params, only: [:create, :index]
    before_action :own_item_or_sold_out, only:[:index]
    before_action :authenticate_user!, only: [:index]
    

    def index
        @order_shipping_address = OrderShippingAddress.new
        gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    end

    def new
        @order_shipping_address = OrderShippingAddress.new
    end


    def create
        @order_shipping_address = OrderShippingAddress.new(order_params)
        if @order_shipping_address.valid?
            pay_item
            @order_shipping_address.save
            return redirect_to root_path
        else
            gon.public_key = ENV['PAYJP_PUBLIC_KEY']
            render 'index', status: :unprocessable_entity
        end
    end

    private
    def find_params
        @item = Item.find(params[:item_id])
    end


    def order_params
        params.require(:order_shipping_address).permit(:postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
            amount: @item.price,
            card: order_params[:token],
            currency: 'jpy'
        )
    end

    def own_item_or_sold_out
        if !user_signed_in? || @item.user_id == current_user.id || @item.order.present?
            redirect_to root_path
        end
    end
end