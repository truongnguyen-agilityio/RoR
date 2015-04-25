class Api::V1::ItemsController < ApplicationController
  before_filter :authenticate_by_auth_token
  before_filter :find_item, only: [:show, :update, :destroy]

  def index
    render json: @current_user.items, only: [:id, :name, :description, :completed], status: 200
    # render json: @current_user.items, status: 200
  end

  def show
    render json: @item, only: [:id, :name, :description, :completed], status: 200
  end

  def update
    @item.assign_attributes(item_params)
    if @item.save
      render json: @item, only: [:id, :name, :description, :completed]
    else
      render json: {message: "couldn't update item"}
    end
  end

  def destroy
  end

  def create
  end

  private
    def find_item
      @item = Item.find(params[:id])
    end
    def item_params
      params.require(:item).permit(:name, :description, :completed)
    end
end
