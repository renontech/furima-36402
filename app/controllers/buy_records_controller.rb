class BuyRecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_find
  before_action :sold_block, only: :index

  def index
    @buy_record_buyer = BuyRecordBuyer.new
  end

  def create
    @buy_record_buyer = BuyRecordBuyer.new(buy_params)
    if @buy_record_buyer.valid?
      pay_item
      @buy_record_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_record_buyer).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end

  def sold_block
    unless @item.buy_record.nil?
      redirect_to root_path
    end
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
