class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      redirect_to @quote
    end
  end

  def edit
    @quote = Quote.find params[:id]
  end

  def update
    @quote = Quote.find params[:id]
    if @quote.update_attributes params[:quote]
      redirect_to @quote
    else
      flash.notice = 'There were some errors.'
      render :edit
    end
  end
end
