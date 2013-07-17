class ShirtsController < ApplicationController
  before_action :load_shirt, :only => [:edit, :update, :show, :destroy]

  def index
    @shirts = Shirt.search_for(params[:query])
  end

  def edit
  end

  def update
  end

  def create
    @shirt = Shirt.new(shirt_params)
    if @shirt.save
      redirect_to @shirt
    else
      render 'new'
    end
  end

  def new
    @shirt = Shirt.new
  end

  def show
  end

  def destroy
    @shirt.destroy
    redirect_to :action => 'index'
  end



  private

  def load_shirt
    @shirt = Shirt.find(params[:id])
  end

  def shirt_params
    params.require('shirt').permit(:name, :description, :image)
  end

end
