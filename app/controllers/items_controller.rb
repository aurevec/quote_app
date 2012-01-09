class ItemsController < ApplicationController
  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    if @item.update_attributes params[:item]
      redirect_to quote_path @item.parent.parent
    else
      flash.notice = 'There were some errors.'
      render :edit
    end
  end
end
