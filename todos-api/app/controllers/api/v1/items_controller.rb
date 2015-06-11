class Api::V1::ItemsController < ApplicationController
  before_filter :authenticate_by_auth_token
  before_filter :find_item, only: [:show, :update, :destroy]
  skip_before_filter :verify_authenticity_token


  def index
    render json: @current_user.items, only: [:id, :name, :description, :completed], status: 200
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
    if @item.destroy
      render json: {message: 'The item was destroyed', success: true}
    else
      render json: {message: 'couldn\'t destroy item', success: false}
    end
  end

  def create
    if Item.create!(item_params)
      render json: Item.last, only: [:id, :name, :description, :completed]
    else
      render json: {message: "couldn't create new item"}
    end
  end

  private
    def find_item
      @item = Item.find(params[:id])
    end
    def item_params
      item_params = {name: params[:name], description: params[:description], completed: params[:completed]}
    end
end
