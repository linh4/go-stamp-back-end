class DealsController < ApplicationController
  def index
    @deals = Deal.all
    render json: @deals
  end

  def show
    render json: @deal
  end

  def create
    @deal = Deal.new(deal_params)
   if @deal.save
     render json: @deal, status: :accepted
   else
     render json: {errors: @deal.errors.full_messages}, status: :unprocessible_entity
   end
  end

  def deal_params
    params.permit(:category, :description, :store_id, :max_points)
  end
end